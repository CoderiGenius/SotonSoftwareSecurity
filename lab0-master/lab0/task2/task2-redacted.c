#include <stdio.h>

int i = 0;

int main() {
    if(i==1) {
        printf("[REDACTED]\n");
        return 0;
    }
    else {
        printf("Exiting and not outputting secret string...\n");
        return 0;
    }

}
