//���������, ����������� ����� � ������ � �������

#include <stdio.h> /* ���� ���������� �����-������*/
#include <locale.h> /* ���� ���������� ��� ����� � ������������*/

int main(void) /*������� �������*/
{
	setlocale(LC_ALL, "RUS"); /* ���������� ������� ����*/
	int a, b, c; /* ������ ���������� ���� ������������*/
	printf("\n������� ���������� �������, ����������� ����� ��������\n"); /* ����� �� �����*/
	if (scanf_s("%d%*c%d", &a, &b) == 2 && getchar() == 10)//����� ������� scanf ��������� ��� ����� � ������ ����� ����. ������������ ������� �����������. getchar ��� �������� �����. ���� scanf ������ ������ ��� ����������, �� ������ 2, ���� ���, ������� �� ����������.
	{
		c = a * 60;//���������� ��� ������ ���������� ������������� ���������� ����� ���������� �� 60
		c += b;// � � ��� �� ����������� ��������� ���������� ������
		printf("���������� ������ ����� - %d\n", c); //����� ����������
		printf("\n��� ���������� ������� <Enter>"); _getch();//�������� ������
	}
	else
	{
		printf("������������ ����"); _getch();
	}
}