#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define ERROR 10

void fatal(const char *msg)
{
    perror(msg);
    exit(0);
}

int main(int argc, char *argv[])
{
    int sockfd, portno, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;

    char url[200], buffer[256];
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) fatal("ERROR # opening socket");
    server = gethostbyname("www.cse.unsw.edu.au");
    if (server == NULL) fatal("ERROR, no such host");
    bzero((char *)&serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);
    serv_addr.sin_port = htons(80);
#ifndef DEBUG
    if (connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr)) < 0)
        fatal("ERROR connecting");
#endif
    char *reqFmt = "GET %s HTTP/1.1\r\nHost: www.cse.unsw.edu.au\r\n\r\n";
    while (1) {
        printf("URL: ");
        if (fgets(url,199,stdin) == NULL) break;
        url[strlen(url)-1] = '\0';
        sprintf(buffer, reqFmt, url);
        n = write(sockfd,buffer,strlen(buffer));
        if (n < 0) fatal("ERROR writing to socket");
        printf("Response:\n");
        while ((n = read(sockfd,buffer,255,0)) > 0)
            write(1, buffer, n);
        if (n < 0) fatal("ERROR reading from socket");
    }
    close(sockfd);
    return 0;
}
