#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#define BUFFOR_SIZE 128

int main() 
{
    pid_t pid;
    int fd[2];
    int counter, status;
    char bufor[BUFFOR_SIZE];
    char fileName[BUFFOR_SIZE];
    FILE *filePointer;

    pipe(fd); //tworzenie anonimowego potoku
    pid = fork(); // Tworzenie procesu dziecka i zapamietanie id rodzica

    if(pid != 0) /*Rodzic*/
    {
        close(fd[0]); //zamykam zbędne wejście potoku
        //pobieram od użytkownika nazwę obrazka do otwarcia
        printf("Podaj nazwe pliku ze zdjeciem: \n");
        scanf("%[^\n]s", fileName);

        filePointer = fopen(fileName, "r"); //otwieram plik o podanej nazwie

        //jezeli plik nie istnieje
        if(filePointer == NULL)	
        {
            printf("Nie ma pliku o podanej nazwie! \n");
            exit(EXIT_FAILURE);
        }
        close(1); //zamknięcie wyjścia, nic więcej nie wypisuję
        
        //ilosc znakow do przesłania
        while((counter=fread(bufor, sizeof(char), BUFFOR_SIZE, filePointer)) > 0)
        {
            write(fd[1], bufor, counter); //pisanie do potoku
        }

        close(fd[1]); //zamykamy wyjście aby proces potomny nie czekał na kolejne dane
        wait(&status); //oczekiwanie na odpowiedź procesu potomnego, bez oczekiwania program sie konczyl
        return(status); 
    }
    else /*Dziecko*/
    {
        close(0);   // zamkniecie wejscia
        close(1);   // i wyjscia
        close(fd[1]); // zamykam niepotrzebne wyjście

        dup(fd[0]); // ozdyskujemy fd0 w potoku
        
        execlp("display", "display", 0, NULL); //Otwieram podany obraz w programie display
    }
    return 0;
}

// inspiracja: https://gist.github.com/a-cordier/33211eda92b8084a9e7e