
// pretty much a multiplexed chat

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <iostream>

#define closesocket close;

void error(char *msg){
    perror(msg);
    exit(0);
}

int main(int argc, char** argv){
	fd_set master, read_dfs;
	struct sockaddr_in myaddr, client;
	int listener, newfd, maxfd, nBytes, yes =1, port = 4321;
	char buffer[50];

	FD_ZERO(&master); FD_ZERO(&read_dfs);

	if((listener = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		error("listener");

	if(setsockopt(listener, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes)) == -1)
		error("setsockopt");

	memset(&myaddr, 0, sizeof(myaddr));
	myaddr.sin_family = AF_INET;
	myaddr.sin_addr.s_addr = INADDR_ANY;
	myaddr.sin_port = htons(port);


	if(bind(listener, (struct sockaddr*)&myaddr, sizeof(myaddr)) == -1) error("bind");

	if(listen(listener, 10) == -1) error("listen");

	FD_SET(listener, &master);

	maxfd = listener;
	std::cout << "Teacher with port "<< port << " waiting for students \n";

	while(true){
		read_dfs = master;
		if(select(maxfd + 1, &read_dfs, NULL ,NULL, NULL) == -1) error("select");

		for(int i = 0; i <= maxfd; i++){
			if(FD_ISSET(i, &read_dfs)){
				if(i == listener){
				// new connection
				auto addrlen = sizeof(client);
				if((newfd = accept(listener, (struct sockaddr*)&client, (socklen_t*)&addrlen)) == -1) error("accept");
				else{
					FD_SET(newfd, &master);
					maxfd = maxfd ? newfd : maxfd > newfd;
					std::cout << "New leader\n";
				}
			}
			else{
				// existing connection
				if((nBytes = recv(i, buffer, sizeof(buffer), 0)) <= 0)
				{
					closesocket(i);
					FD_CLR(i, &master);
				}
				else{
					char generic_answer[50] = "Generic answer 1";
					buffer[nBytes] = '\0';
					std::cout << "Teacher received question: " << buffer << std::endl << std::flush;
					std::cout << "Teacher will send answer: " << generic_answer << std::endl << std::flush;
					send(i, generic_answer, sizeof(generic_answer), 0);
				}
			}
			}
		}
	}

}