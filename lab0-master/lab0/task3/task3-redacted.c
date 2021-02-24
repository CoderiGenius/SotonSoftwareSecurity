#include <stdio.h>
#include <stdlib.h>

void correct() {
    // ACTUAL FUNCTION REDACTED 
    printf("[REDACTED]\n");
}

void wrong() {
    printf("That's not the number i was thinking.\n");
}

void usage() {
    printf("Usage: task3 <guess>\n\n    guess: what number i'm thinking of\n\n"); 
}

int main(int argc, char** argv) {

    if(argc!=2) { 
        usage();
        return 1;
    }

    if(atoi(argv[1])==[REDACTED]){
        correct();
        return 0;
    }
    else {
        wrong();
        return 1;
    }

}
