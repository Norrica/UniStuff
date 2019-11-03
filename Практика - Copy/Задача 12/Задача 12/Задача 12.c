//���������� ������������� ���������
//�������� ���������, ������� ������� ������������ �������� ������� ��������������� � ������� ��������.
//�������� ������ ���������.��� �������������� ����� ������ h = 0, 01. ������ ����� ������ ���� ���������� � ���� ��������� �������.

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <locale.h>
#include <stdlib.h>
#include <math.h>
#define h 0.01
double p(double a, double b, double n)
{
	
	double S, sum = 0;
	for (int i = 1; i <= n + 1; i++)
	{
		sum += tan(0.1)*(pow(a + (i - 1)*h + h / 2, 2) + sqrt(1 + 0.1*(a + (i - 1)*h + h / 2)));
	}
	S = sum*h;
	return S;
}

double t(double a, double b, double n)
{
	
	double S, sum = 0;	
	for (int i = 0; i < n; i++)
	{
		sum += tan(0.1)*(pow(a + i*h + h / 2, 2) + sqrt(1 + 0.1*(a + i*h + h / 2)));
	}
	S =	h*((tan(0.1)*(pow(a, 2) + sqrt(1 + 0.1*(a))) + tan(0.1)*(pow(b, 2) + sqrt(1 + 0.1*(b)))) / 2 + sum);
	return S;
}

int main(void)
{
	setlocale(LC_ALL, "Rus");
	double n, S1, S2;
	int a = 1, b = 3;
	printf("���������� ���������:\n tan(0.1)(x^2 + sqrt(1 + 0.1x))\n �� ������� �� 1 �� 3\n");
	n = (b - a) / h;

	S1 = p(a, b, n);
	S2 = t(a, b, n);
	if (!isfinite(S1) || !isfinite(S2))
	{
		printf("������");
		_getch();exit(0);
	}
	else
	{
		printf("�������, ����������� ������� ��������������� ����� %f", S1);
		printf("\n�������, ����������� ������� �������� ����� %f", S2);
	}
	_getch();
}

//tan(0.1)*(pow(x, 2) + sqrt(1 + 0.1*x))
//tan(0.1)*(pow(a + (i - 1)*h + h / 2, 2) + sqrt(1 + 0.1*(a + (i - 1)*h + h / 2))