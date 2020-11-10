#include <iostream>
#include <chrono>
#include <utility>
#include <cstdlib>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <arpa/inet.h>
#include <thread>
#include <stack>
#include <stdio.h>      
#include <stdlib.h>     
#include <time.h>
#include <random>
#define closesocket close
#define SOCKET int

/// ~ Kinda works, pretty bugged  

int teacher_port = 4321;
int teacher_address = inet_addr("127.0.0.1");

int true_random(int max){
	std::mt19937 rng(std::random_device{}());
	return rng() % max;
}

void error(char *msg){
    perror(msg);
    exit(0);
}

void broadcast_answer(int sock, int port, struct sockaddr_in& Sender, char* to_send){
	sendto(sock, to_send, strlen(to_send) + 1, 0,
			(struct sockaddr*)& Sender, sizeof(Sender));
}

void broadcast_leader(int sock, int port, struct sockaddr_in& Sender){
	
	char to_send[] = "I am your leader";

	while(true){
		std::cout << "Leader signal sent \n" << std::flush;
		sendto(sock, to_send, strlen(to_send) + 1, 0,
			(struct sockaddr*)& Sender, sizeof(Sender));
		sleep(5);
	}
}

void listen_for_leader(int sock, int port, struct sockaddr_in& Sender){
	
	char buffer[50];
	int bufferlen = 50;
	socklen_t len = sizeof(Sender);
	while(true){
		recvfrom(sock, buffer, bufferlen, 0,
			(struct sockaddr*)&Sender, &len);
		sleep(3); // to not overload
	}
}

void get_teacher_ans(char* question, SOCKET teacher_socket){

	send(teacher_socket, question, strlen(question), 0);
	char answer[50];
	int nBytes = read(teacher_socket, answer, sizeof(answer) - 1);
	if(nBytes  <= 0){
		std::cout << "Answer was not succesfull sent :(\n ";
	}
	else{
		answer[nBytes] = '\0';
		std::cout << answer << "\n" <<std::flush;
	}


}

void handle_leader(int port){
	SOCKET sock = socket(AF_INET, SOCK_DGRAM, 0);
	int broadcast = 1;

	if(setsockopt(sock, SOL_SOCKET, SO_BROADCAST, &broadcast, sizeof(broadcast)) < 0)
		error("setsock");
	if(setsockopt(sock, SOL_SOCKET, SO_REUSEPORT, &broadcast, sizeof(broadcast)) < 0)
		error("setsock");

	struct sockaddr_in Recv, Sender;
	Recv.sin_family = AF_INET;
	Recv.sin_port = htons(port);
	Recv.sin_addr.s_addr = INADDR_BROADCAST;


	std::thread broadcast_leader_thread(broadcast_leader, sock, port, std::ref(Recv));


	// teacher connection
	SOCKET teacher_socket = socket(AF_INET, SOCK_STREAM, 0);
	struct sockaddr_in teacher;

	memset(&teacher, 0, sizeof(teacher));
	teacher.sin_family = AF_INET;
	teacher.sin_addr.s_addr = teacher_address;
	teacher.sin_port = htons(teacher_port);
	if(connect(teacher_socket, (struct sockaddr*)&teacher, sizeof(teacher)) < 0) error("teacher connection");

	// listen for questions
	char question[50];
	int questionlen = 50;
	socklen_t len = sizeof(Recv);
	while(true){
		recvfrom(sock, question, questionlen, 0,
			(struct sockaddr*)&Recv, &len);
		std::cout << "Received question: " << question << " ";
		// send question to teacher
		get_teacher_ans(question, teacher_socket);
	}

	broadcast_leader_thread.join();

}

void hanlde_student(int port){

	SOCKET sock = socket(AF_INET, SOCK_DGRAM, 0);
	int broadcast = 1, yes = 1;
	struct sockaddr_in Recv, Sender;

	if(setsockopt(sock, SOL_SOCKET, SO_BROADCAST, &broadcast, sizeof(broadcast)) < 0)
		error("setsock");
	if(setsockopt(sock, SOL_SOCKET, SO_REUSEPORT, &yes, sizeof(yes)) < 0)
		error("setsock");

	Recv.sin_family = AF_INET;
	Recv.sin_port = htons(port);
	Recv.sin_addr.s_addr = INADDR_ANY;

	if(bind(sock, (sockaddr*)&Recv, sizeof(Recv)) < 0)
		error("bind");

	// wait for connection with the leader
	char buffer[50];
	int bufferlen = 50;
	socklen_t len = sizeof(Sender);

	std::cout << "Searching for leader\n";
	while(true){
		recvfrom(sock, buffer, bufferlen, 0,
			(struct sockaddr*)&Sender, &len);
		if(strlen(buffer) > 0)
		{
			std::cout << "Leader found\n" << std::flush;
			break;
		}
	}

	std::thread listen_for_leader_thread (listen_for_leader, sock, port , std::ref(Sender));

	// send random questions;
	char* questions[4] = {"Question1", "Question2", "Question3", "Question4"};
	srand(time(NULL));

	while(true){
		if(true_random(2) == 0){

			auto question = questions[true_random(4)];
			std::cout << "I will send question: " << question << std::endl << std::flush;

			sendto(sock, question, strlen(question) + 1, 0,
				(struct sockaddr*)&Sender, sizeof(Sender));

		}
		sleep(3);
	}


	listen_for_leader_thread.join();

}

int main(int argc, char** argv){

	// run ./client 1234 1 - leader
	//	   ./client 1234 0 - student

	int group_port = std::stoi(argv[1]);
	int i_am_leader = std::stoi(argv[2]);

	if(i_am_leader)
		handle_leader(group_port);
	else
		hanlde_student(group_port);

	return 0;
}