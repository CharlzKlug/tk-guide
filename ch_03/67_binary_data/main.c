#include <stdio.h>
#include <fcntl.h>
#include <string.h>

int main () {
  struct a {
    int i;
    float f[2];
    char s[20];
  } aa;
  FILE *of;

  aa.i = 100;
  aa.f[0] = 2.5;
  aa.f[1] = 3.8;

  strcpy(aa.s, "This is a test");

  of = fopen("tstStruct", "w");
  fwrite(&aa, sizeof(aa), 1, of);
  fclose(of);
}
