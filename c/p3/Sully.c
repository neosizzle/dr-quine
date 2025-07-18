#include <stdio.h>
#include <stdlib.h>
int main()
{
	int x = 5;

	char out_name[10];
	sprintf(out_name,"Sully_%d.c", x);
	char *out_contents = "#include <stdio.h>%1$c#include <stdlib.h>%1$cint main()%1$c{%1$c	int x = %3$d;%1$c%1$c	char out_name[10];%1$c	sprintf(out_name,%2$cSully_%5$cd.c%2$c, x);%1$c	char *out_contents = %2$c%4$s%2$c;%1$c%1$c	char compile_cmd[100];%1$c	sprintf(compile_cmd,%2$cgcc Sully_%5$c1$d.c -o Sully_%5$c1$d%2$c, x);%1$c%1$c	char exec_cmd[100];%1$c	sprintf(exec_cmd,%2$c./Sully_%5$cd%2$c, x);%1$c	if (x >= 0)%1$c	{%1$c		FILE *fptr = fopen(out_name, %2$cw%2$c);%1$c		fprintf(fptr, out_contents, 10, 34, x - 1, out_contents, 37);%1$c		fclose(fptr);%1$c		system(compile_cmd);%1$c		system(exec_cmd);%1$c	}%1$c}";

	char compile_cmd[100];
	sprintf(compile_cmd,"gcc Sully_%1$d.c -o Sully_%1$d", x);

	char exec_cmd[100];
	sprintf(exec_cmd,"./Sully_%d", x);
	if (x >= 0)
	{
		FILE *fptr = fopen(out_name, "w");
		fprintf(fptr, out_contents, 10, 34, x - 1, out_contents, 37);
		fclose(fptr);
		system(compile_cmd);
		system(exec_cmd);
	}
}