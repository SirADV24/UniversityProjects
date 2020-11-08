#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <arpa/inet.h>
#include <iostream>


int main(){

	char str[100];
	int c, spaces;
	struct sockaddr_in server,client;
	c = socket(AF_INET, SOCK_STREAM, 0);

   	if (c < 0) {
        printf("Eroare la crearea socketului client\n");
        return 1;
   	}

	memset(&server, 0, sizeof(server));
	server.sin_port = htons(1234);
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = inet_addr("127.0.0.1");

	if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
		printf("Eroare la conectarea la server\n");
		return 1;
	}

	std::cin.getline(str, 100);
	send(c, str, strlen(str), 0);

	recv(c, &spaces, sizeof(spaces), 0);
	spaces = ntohs(spaces);

	std::cout << "Spaces:= " << spaces << std::endl;


	return 0;
}