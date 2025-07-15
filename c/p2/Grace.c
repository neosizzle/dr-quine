/*
	goblin game?
*/
#include <stdio.h>
char *f = "Grace_kid.c";
char *s = "/*%c	goblin game?%c*/%c#include <stdio.h>%cchar *f = %c%s%c;%cchar *s = %c%s%c;%c#define FT() int main(){FILE *fptr = fopen(f, %cw%c);fprintf(fptr,s,10,10,10,10,34,f,34,10,34,s,34,10,34,34,10);fclose(fptr);}%cFT()";
#define FT() int main(){FILE *fptr = fopen(f, "w");fprintf(fptr,s,10,10,10,10,34,f,34,10,34,s,34,10,34,34,10);fclose(fptr);}
FT()