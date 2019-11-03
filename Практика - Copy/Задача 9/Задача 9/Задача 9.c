//Записать в двоичный файл N действительных чисел; N вводится пользователем.Вычислить произведение элементов файла и вывести на экран.

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <conio.h>
#include <locale.h>
#include <malloc.h>
#include <math.h>
#include <stdlib.h>

void fscan(float *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%8f", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("Ошибка, введены некорректные данные.\nПовторите ввод\n");
		rewind(stdin);
	}
}
void iscan(int *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%8d", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("Ошибка, введены некорректные данные.\nПовторите ввод\n");
		rewind(stdin);
	}
}

int main()
{
	setlocale(LC_ALL, "Rus");
	srand(time(NULL));

	FILE *F1;
	int a=0, b, c=1, d, e, f;
	F1 = fopen("D:\\input.dat", "wb");
	puts("Введите количество чисел\n");
	iscan(&a);
	if(a<0) {  puts("Количество чисел не может быть меньше 1\n"); }
	for (int i = 0; i < a; i++)
	{
		b = rand() % 20 - 10; printf("%d\n", b);
		c *= b;
		fwrite(&b, sizeof(int), 1, F1);
	}
	printf("Произведение чисел в файле равно %d", c);

	_getch();
}