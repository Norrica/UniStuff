//С клавиатуры вводятся две строки. Ввод прекращается при нажатии клавиши Enter. Найти число вхождений меньшей строки в большую. 
//При совпадении длин строк проверить на лексическое равенство строк.

#include <stdio.h>
#include <conio.h>
#include <locale.h>
#include <malloc.h>
#include <math.h>
#include <stdlib.h>
#include<string.h>
#define A 255

int kostil(char* a, char* b)
{
	int c, d = 0, e;
	
	for (int i = 0; i < strlen(a);i++)
	{
		c = 0;e = i;
		if (a[e] == b[c])
		{
			for (e, c = 0;a[e] == b[c] && c<strlen(b); e++, c++);
			if (c == strlen(b))
			{
				d++;
			}
		}

	}
	return d;
}

int main()
{
	setlocale(LC_ALL, "rus");
	char a[A];
	char b[A];	
	puts("Введите первую строку\n");
	gets_s(a,A);
	puts("Введите вторую строку\n");
	gets_s(b,A);
	
	if (strlen(a)>strlen(b))
	{
		printf("Количество вхождений меньшей строки равно %d\n", kostil(a, b));
	}
	else if (strlen(a) < strlen(b))
	{
		printf("Количество вхождений меньшей строки равно %d\n", kostil(b, a));
	}
	else if (strlen(a) == strlen(b))
	{
		if (strcmp(a, b) == 0) {
			puts("Строки идентичны");
		}
		else if (strcmp(a, b) > 0) {
			puts("Первая строка лексически больше");
		}
		else if (strcmp(a, b) < 0) {
			puts("Первая строка лексически меньше");
		}
	}
		_getch();
}
