#include <stdio.h>
#include <conio.h>
#include <locale.h>
#include <malloc.h>
#include <math.h>
#include <stdlib.h>
#include<Windows.h>

void fscan(float *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%9f", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("Ошибка, введены некорректные данные.\nПовторите ввод\n");
		rewind(stdin);
	}
}
void dscan(double *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%9g", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("Ошибка, введены некорректные данные.\nПовторите ввод\n");
		rewind(stdin);
	}
}
void iscan(int *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%9d", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("\nОшибка, введены некорректные данные.\nПовторите ввод\n");
		rewind(stdin);
	}
}
void cscan(char *a)//Выводит не русский язык. Переделать. Скореее всего дело в указателях.
{
	printf("\n%c\n", *a);
	while (((scanf_s("%1c", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("\nОшибка, введены некорректные данные.\nПовторите ввод\n");printf("\n%d\n", *a);
		rewind(stdin);
	}
	printf("\n%c\n", *a);
}

int main()
{
	setlocale(LC_ALL, "Rus");
	int a;
	float b;
	char c = '1';printf("%c\n", c);
	iscan(&a);
	printf("Наконец-то введено верно.\n%d",a);

	/*fscan(&b);
	printf("Наконец-то введено верно.\n%f",b);*/


	cscan(&c);
	/*printf("Наконец-то введено верно.\n%c", c);*/printf("\n%c\n", c);
	
	

	_getch();
}
