#include <unistd.h> //close, dup, execlp
#include <stdio.h> // BUFSIZ

#define FIFO "fifopipe1"

void main()
{
  int potok_fd;
  char bufor[BUFSIZ];

  close(0);
  close(potok_fd);

  dup(potok_fd);

  //execlp("tail","tail", "fifopipe1", NULL);
  execlp("tail","tail", "-f" ,"fifopipe1", NULL); 
}

// tworzymy potok nazwany przy pomocy polecenia: mknod fifopipe1 p
// Kompilujemy oba programy read.c oraz write.c przy pomocy skryptu compile.sh
// uruchamiamy w nowym oknie terminala programu read.c, który słucha na potoku
// następnie w starym oknie terminala uruchamiamy program write.c, który pisze do potoku