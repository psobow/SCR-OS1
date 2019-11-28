#include <fcntl.h>
#define FIFO "fifopipe1"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

void main()
{
  int potok_fd,p,d;
  char bufor[BUFSIZ];

  d=open("tekst.txt",O_RDONLY);

  potok_fd = open(FIFO,O_WRONLY);
  while((p=read(d,bufor,BUFSIZ))>0)
  {
    write(potok_fd, bufor, p);
  }

}