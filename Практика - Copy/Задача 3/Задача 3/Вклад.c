//�������� �������, ������� ��������� ����� �� ������. ��������� ������� ��� ������� ��������: 
//�������� ������, ���������� ������ (�������) � ���� ������ (���������� ����). ���������� ���� � ���� ������� ������ 365.

#include<stdio.h>
#include <math.h>
#include <locale.h>


void fscan(float *a)//������� ������������ �����
{
	if (scanf_s("%f", &*a) == 1 && getchar() == 10) {}
	else
	{
		printf("����� ������� �������\n"); _getch(); exit(0);
	}
}

float vklad(float a, float b, float c)//������� �������� �� ���� ����� ������, ������, � ����
{
	float sum=0;//���������� ������
	for (int i = 0; i < c; i++)//����,������������ ������ ������
	{
		sum += a*b;//���������� ����� ������ � ����������
	}
	
	return sum;
}

int main()
{
	setlocale(LC_ALL, "Rus");//�����������
	float a, st,sr,b=0;//���������� ����������

	printf("������� ����� ������\n");
	fscan(&a);
	printf("������� ������(� ���������)\n");
	fscan(&st);
	printf("������� ���� ������(� ����)\n");
	fscan(&sr);
	st = st / 100 + 1;//������� ��������� � ������� �����
	sr = sr/365;//���������� ����� ������ � �����

	b=vklad(a,st,sr);//��������� ������� ��� �������� �����������

	printf("����� �������� %f ������", b-a);//����� ����������
	_getch();//�������� �������
}
