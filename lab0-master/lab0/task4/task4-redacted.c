#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int check(char * input) {
    // ACTUAL FUNCTION REDACTED 
    printf("[REDACTED]\n");
}

void correct() {
    // ACTUAL FUNCTION REDACTED 
    printf("[REDACTED]\n");
}

void wrong() {
    printf("That's not the number i was thinking.\n");
}

void usage() {
    printf("Usage: task4 <guess>\n\n    guess: what number i'm thinking of\n\n"); 
}


int main(int argc, char** argv) {

    usleep(500000); // half sec to stop brute force

    if(argc!=2) { 
        usage();
        return 1;
    }

    if(check(atoi(argv[1]))){
        correct();
        return 0;
    }
    else {
        wrong();
        return 1;
    }

}
