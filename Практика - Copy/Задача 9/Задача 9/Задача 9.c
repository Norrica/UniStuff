//�������� � �������� ���� N �������������� �����; N �������� �������������.��������� ������������ ��������� ����� � ������� �� �����.

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
		printf("������, ������� ������������ ������.\n��������� ����\n");
		rewind(stdin);
	}
}
void iscan(int *a)
{
	setlocale(LC_ALL, "Rus");
	while (((scanf_s("%8d", &*a) != 1) || (getchar() != 10) || isfinite(*a) == 0))
	{
		printf("������, ������� ������������ ������.\n��������� ����\n");
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
	puts("������� ���������� �����\n");
	iscan(&a);
	if(a<0) {  puts("���������� ����� �� ����� ���� ������ 1\n"); }
	for (int i = 0; i < a; i++)
	{
		b = rand() % 20 - 10; printf("%d\n", b);
		c *= b;
		fwrite(&b, sizeof(int), 1, F1);
	}
	printf("������������ ����� � ����� ����� %d", c);

	_getch();
}