//� ���������� �������� ��� ������. ���� ������������ ��� ������� ������� Enter. ����� ����� ��������� ������� ������ � �������. 
//��� ���������� ���� ����� ��������� �� ����������� ��������� �����.

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
	puts("������� ������ ������\n");
	gets_s(a,A);
	puts("������� ������ ������\n");
	gets_s(b,A);
	
	if (strlen(a)>strlen(b))
	{
		printf("���������� ��������� ������� ������ ����� %d\n", kostil(a, b));
	}
	else if (strlen(a) < strlen(b))
	{
		printf("���������� ��������� ������� ������ ����� %d\n", kostil(b, a));
	}
	else if (strlen(a) == strlen(b))
	{
		if (strcmp(a, b) == 0) {
			puts("������ ���������");
		}
		else if (strcmp(a, b) > 0) {
			puts("������ ������ ���������� ������");
		}
		else if (strcmp(a, b) < 0) {
			puts("������ ������ ���������� ������");
		}
	}
		_getch();
}
