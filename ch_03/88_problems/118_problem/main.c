#include <stdio.h>
#include <fcntl.h>
#include <string.h>

int main () {
  struct a {
    int i[4];
    float f;
    char s[25];
  } aa;
  FILE *of;

  aa.i[0] = 5;
  aa.i[1] = 13;
  aa.i[2] = 17;
  aa.i[3] = 23;

  aa.f = 2.5;
  
  strcpy(aa.s, "This is a test");

  of = fopen("tstStruct", "w");
  fwrite(&aa, sizeof(aa), 1, of);
  fclose(of);
}
