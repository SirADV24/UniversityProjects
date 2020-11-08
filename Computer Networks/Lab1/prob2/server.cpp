#include <iostream>
#include <vector>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <arpa/inet.h>

#define port 1234

int main(int argc, char* argv[]){
	int s, n, c, tmp, i;
	socklen_t l;
	struct sockaddr_in server, client;

	s = socket(AF_INET, SOCK_STREAM, 0);
	if(s < 0){
		std::cout<< "Error while connecting to the server.\n";
		return 1;
	}

	memset(&server, 0, sizeof(server));
	server.sin_port = htons(port);
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;

	if(bind(s, (struct sockaddr*)&server, sizeof(server)) < 0 ){
		std::cout << "Error while binding.\n";
		return 1;
	}

	listen(s, 5);

	l = sizeof(client);
	memset(&client, 0, sizeof(client));

	while(true){
	
		std::cout << "Listening ... \n";
		c = accept(s, (struct sockaddr*)&client, &l);
		if (c < 0){
			std::cout << "Error connecting to client.\n";
			continue;
		}


		char str[100];
		int noBytes;

		if(( noBytes = recv(c, str, sizeof(str), 0)) <= 0){
			std::cout << "Error.\n";
			continue;
		}

		str[noBytes] = '\0';
		
		std::cout << str;

		int spaces = 0;
		for(i = 0 ; i < noBytes; i++){
			if(str[i] == ' ')
				spaces++;
		}

		spaces = htons(spaces);

		send(c, &spaces, sizeof(spaces), 0);
	
	}
}
