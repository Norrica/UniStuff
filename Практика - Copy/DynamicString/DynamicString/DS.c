#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <conio.h>
#include <string.h>
#include<Windows.h>

 char* getDynamicString(void) {
	SetConsoleCP("1251");
	SetConsoleOutputCP("1251");
	 char* str = ( char*)malloc(sizeof(char));
	int cnt = 1;
	char ch;

	while (1) {
		ch = _getch();
		cnt += 1;
		str = (char*)realloc(str, sizeof(char)*cnt);
		str[cnt - 2] = ch;
		printf("%c", ch);
		if (ch == '\r') {
			str[cnt - 1] = '\0';
			break;
		}
	}
	return str;
}

int charCounter( char* str,  char ch) {
	int cnt = 0;
	for (int i = 0; i < strlen(str); i++) {
		if (str[i] == ch) cnt += 1;
	}
	return cnt;
}

int main(void)
{
	//setlocale(LC_ALL, "Rus");
	SetConsoleCP("1251");
	//SetConsoleOutputCP("1251");

	char* string;

	printf("Введите строку: ");
	string = getDynamicString();

	printf("\nВведите искомый символ: ");
	char cr = _getch();
	printf("%c", cr);

	printf("\nКоличество данных символов в строке равно %d\n",  charCounter(string, cr));

	_getch();
	return 0;
}
