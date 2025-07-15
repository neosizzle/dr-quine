#include <unistd.h>
#include <string.h>
/*
	readable quine?!?!
*/
void print_arr(const char **arr)
{
	int i;

	i = -1;
	char tab = 9;
	char nl = 10;
	char quo = 34;
	char coma = 44;
	while (arr[++i] != 0)
	{
		write(1, &tab, 1);
		write(1, &tab, 1);
		write(1, &quo, 1);
		write(1, arr[i], strlen(arr[i]));
		write(1, &quo, 1);
		write(1, &coma, 1);
		write(1, &nl, 1);
	}
}

int main()
{
	/*
		what is sports in malay?
	*/
	const char *strings[] = {
		"#include <unistd.h>",
		"#include <string.h>",
		"/*",
		"	readable quine?!?!",
		"*/",
		"void print_arr(const char **arr)",
		"{",
		"	int i;",
		"",
		"	i = -1;",
		"	char tab = 9;",
		"	char nl = 10;",
		"	char quo = 34;",
		"	char coma = 44;",
		"	while (arr[++i] != 0)",
		"	{",
		"		write(1, &tab, 1);",
		"		write(1, &tab, 1);",
		"		write(1, &quo, 1);",
		"		write(1, arr[i], strlen(arr[i]));",
		"		write(1, &quo, 1);",
		"		write(1, &coma, 1);",
		"		write(1, &nl, 1);",
		"	}",
		"}",
		"",
		"int main()",
		"{",
		"	/*",
		"		what is sports in malay?",
		"	*/",
		"	const char *strings[] = {",
		"		0};",
		"",
		"	char nl = 10;",
		"	for (int i = 0; i < 32; i++)",
		"	{",
		"		write(1, strings[i], strlen(strings[i]));",
		"		write(1, &nl, 1);",
		"	}",
		"	print_arr(strings);",
		"	for (int i = 32; i < 47; i++)",
		"	{",
		"		write(1, strings[i], strlen(strings[i]));",
		"		write(1, &nl, 1);",
		"	}",
		"}",
		0};

	char nl = 10;
	for (int i = 0; i < 32; i++)
	{
		write(1, strings[i], strlen(strings[i]));
		write(1, &nl, 1);
	}
	print_arr(strings);
	for (int i = 32; i < 47; i++)
	{
		write(1, strings[i], strlen(strings[i]));
		write(1, &nl, 1);
	}
}
