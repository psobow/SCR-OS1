#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

void* foo()
{
    printf("hello from new thread ID = %ld\n", pthread_self());
    pthread_exit(NULL);
}

int main()
{
    pthread_t t1, t2;
    printf("starting thread\n");
    pthread_create(&t1, NULL, foo, NULL);
    pthread_create(&t2, NULL, foo, NULL);
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    pthread_exit(NULL);
    
    return 0;
}

// gcc program1.c -o program -lpthread