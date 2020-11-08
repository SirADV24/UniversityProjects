#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>

int main() {

       struct sockaddr_in server;
       int c, n, tmp, i, sum;

       c = socket(AF_INET, SOCK_STREAM, 0);
       if (c < 0) {
              printf("Eroare la crearea socketului client\n");
              return 1;
       }

       memset(&server, 0, sizeof(server));
       server.sin_port = htons(1235);
       server.sin_family = AF_INET;
       server.sin_addr.s_addr = inet_addr("127.0.0.1");

       if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
              printf("Eroare la conectarea la server\n");
              return 1;
       }

       printf("n= ");
       scanf("%d", &n);

       n = htons(n);
       send(c, &n, sizeof(n), 0);
       n = ntohs(n);
       
       for(i = 0 ; i < n; i++)
       {
              scanf("%d", &tmp);
              tmp = htons(tmp);
              send(c, &tmp, sizeof(tmp), 0);
              memset(&tmp, 0, sizeof(tmp));
       }

       recv(c, &sum, sizeof(sum), 0);
       sum = ntohs(sum);

       printf("Sum:= %d.\n", sum);


       close(c);
       return 0;
}      


