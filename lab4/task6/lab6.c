#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h> 
#include <sys/types.h>

void signal_handler( int signal_num ) 
{
    if (signal_num == 3) 
    {
        printf("Sygnal SIGQUIT, konczenie pracy\n");
        exit(signal_num);
    } 
    else if (signal_num == 15) 
    {
        printf("Sygnal SIGTERM, kontynuacja dzialania\n");
    } 
    else if (signal_num == 10) // 10 = SIGUSR1
    {
        printf("Sygnal SIGUSR1\n");
        signal(signal_num, SIG_DFL); // SIG_DFL = Default handling − The signal is handled by the default action for that particular signal.
    } 
}

int main() 
{
    pid_t pid = getpid();
    int i = 0;
    signal(SIGQUIT, signal_handler);
    signal(SIGTERM, signal_handler);
    signal(SIGUSR1, signal_handler);
    signal(SIGUSR2, SIG_IGN); // SIG_IGN = Ignore Signal − The signal is ignored.

    while(1) 
    {  
        ++i;
        usleep(100); // usleep - suspend execution for microsecond intervals
        
        /*
        Fragment kodu potrzebny aby wysłać po krótkiej chwili sygnał SIGUSR1 oraz SIGUSR2 do programu
        
        if ( i > 5000)
        {
            kill(pid, SIGUSR2);
        }
        */
    }
    return 0;
} 

