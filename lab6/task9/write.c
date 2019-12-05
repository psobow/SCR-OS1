#include <fcntl.h> // O_RDONLY, O_WRONLY
#include <unistd.h> // read, write
#include <stdio.h> // BUFSIZ

#define FIFO "fifopipe1"

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