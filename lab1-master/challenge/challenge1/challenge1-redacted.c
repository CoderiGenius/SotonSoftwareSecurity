#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int check(int mod)
{
  if(mod==[REDACTED HEX NUMBER]) {
      [REDCACTED FLAG PRINTING CODE]
    return 1;
  }
  return 0;
}

int main(int argc, char **argv)
{
 volatile int modified;
 char buffer[64];

 modified = 0;

 gets(buffer);

 if(check(modified)) {
  printf("you have correctly modified the variable\n");
 } else {
  printf("Try again, you got 0x%08x\n", modified);
 }

}
