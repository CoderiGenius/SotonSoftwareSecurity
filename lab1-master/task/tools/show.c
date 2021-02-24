// show.c - prints address of stack pointer and exits.

#include <stdio.h>

int main(int argc, char *argv[]) {
    int i=0;
    printf("%p\n", (void*)&i - sizeof(i));
}
