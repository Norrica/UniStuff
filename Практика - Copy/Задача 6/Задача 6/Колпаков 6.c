//� ���������� ������������ ��������, ��������� �� n ������������� ���������, ���������� ��������� �������� :
//1) ����� ����� ������������� �������� �������;
//2) ��������� ������������ ��������� �������, ������������� ����� ������ � ������ �������� ����������;
//3) ������������� ������ ����� �������, ����� � ������ ��� �������� ������������� ��������, �������� �� �������� ��������, � �� ������ �������� � ��������, �������� �� ������ ��������.
//
//����������: ������� �������� � �������� ��������� �������� �������������.��� �������� ��� ��������� ����������� ���������� ��������� � ��� �������, � ������� ��� ������� � �������.
//� ������ ������ ���������� ������������� ������� ����� � ���������� ����������� �������.����� ����, � ������ ������ ������ ���� ����������� �������� �� ����������� ����(��.���������� 2).

#include<stdio.h>
#include<malloc.h>
#include<locale.h.>
#include<stdlib.h>
#include<time.h>

void scan(int *a)
{
	while (((scanf_s("%9d", &*a) != 1) || (getchar() != 10)))
	{
		printf("\n������, ������� ������������ ������.\n��������� ����\n");
		rewind(stdin);
	}
}

int main()
{
	setlocale(LC_ALL, "Rus");
	srand(time(NULL));
	int *a,//��������� �� ������� ������
		b, //��� �����������
		c = -100,//����������� �������� ��� ������ ������������� ��������
		d,//���������� ����� ������������� �������� � ������ 1
		f;//��� ������ ������� �����

	puts("������� ���������� ��������� � �������\n");
	scan(&b);
	if (b<0)
	{
		puts("����������� ������� ������ ���� ������������");_getch();exit(0);//����� �� ��������� ��� ����� ������������� ��������
	}
	a = (int*)malloc(b*sizeof(int));//��������� ������
	puts("�������� ������ �����\n(1- ������, 0 - �������������)\n");
	scan(&f);
	switch (f)
	{
	default:puts("��� ������ �������");_getch();exit(0);
		break;
	case1:
		for (int i = 0; i < b; i++)
		{
			scan(&a[i]);
		}
		break;
	case 0:	
		for (int i = 0; i < b; i++)
	{
		a[i] = rand() % 200 - 100;printf("%d\t", a[i]);
	}
		break;
	}


	//#1
	for (int i = 0; i < b; i++)//���� �� ������ �� ����� �������
	{
		if (a[i]>c)//���������� ��� ������� ������� � ��� �����, ���� �� ������ ��� ����������� ��������
		{
			c = a[i];d = i;
		}
	}
	printf("\n����� ������������� �������� � ������� ����� %d\n", d+1);

	//#2	
	{
	int e = 1;//���������� ������������ ���������
	int ind1 = -1, ind2 = -1;//�����, 
	for (int i = 0; i < b; i++)//������� ����� ����������� ����� ����� ������ �������� ������� ������� � ������� ������� ��������� ��������������
	{
		if (a[i] == 0 && ind1 == -1)//���� ������� ������� � ����1 ��� �� ������ ������� ��������,
		{
			ind1 = i;//�� ��� ������������� ����� ��������
			i++;
		}
		if (a[i] == 0 && ind1 != -1)//���� ������ ���� �� ����� -1, �.�. ��� ����� ��������, �� ������� ����� ������������� ����� �������� �������� 
		{
			ind2 = i;
			break;//� ���� �����������
		}
	}
	int dif = ind2 - ind1;//���������� ��� ����� ���������� ������ ������
	if (dif > 0 && dif < 2)
	{
		printf("����� ������ ������ ���\n");
	}
	if (dif == 2)
	{
		printf("%d\n", a[ind2 - 1]);
	}
	if (ind1 == -1 && ind2 == -1)
	{
		printf("����� ���\n");
	}
	if (dif > 2)
	{
		for (int i = ind1 + 1; i < ind2; i++)//����, ���������� �������� ����� �������, ���� dif ������ ����
		{
			e = e * a[i];//��������������� ���������
		}
		printf("������������ ��������� ����� ������ ����� %d\n", e);//����� ����������

	}
	if (ind1 != -1 && ind2 == -1)
	{
		printf("������� ���� ���\n");
	}
	}
	//#3
	int j = 0;
	for (int i = 0; i<b / 2; i++)//���� �� ������ �� �������� �������
	{
		int buf = a[i];
		for (j = i; j < b - 1; j++) //���� �� i �� ����� �������,
		{
			a[j] = a[j + 1];//������� ������� ��� �������� �� ������� �����
		}
		a[j] = buf;//������������ ���������� �������� i-�� ��������
	}
	
	printf("\n\n����� ������������ ������ �������� ���:\n\n");
	for (int i = 0; i < b; i++)//����� ����������� �������
	{
		printf("%d\t", a[i]);
	}
	_getch();
}