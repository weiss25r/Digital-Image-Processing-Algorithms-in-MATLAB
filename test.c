#include <stdio.h>
#include <stdlib.h>>

#define N 80

int main(void)
{
    char *mess = (char *)malloc(sizeof(char)*N);
    fgets(mess, N, stdin);
    fprintf(stdout, "Hai scritto: %s", mess);
    free(mess);
}