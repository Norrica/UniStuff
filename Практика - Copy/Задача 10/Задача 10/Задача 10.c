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
	while ((scanf_s("%f", &*a) != 1) || (getchar() != 10) || (isfinite(*a) == 0) || (isnan(*a) != 0))
	{
		printf("Неверный ввод\nПопробуйте еще раз\n");
		rewind(stdin);
	}
}

float fxy(float x, float y)
{
	float f;
	f = -4 * pow(x, 3)*pow(y, 3) - 2 * x*y;
	return f;
}

float solve(float f, float y, float h)
{
	float yi;
	yi = y + h*f;
	return yi;
}

int main()
{
	setlocale(LC_ALL, "RUS");
	float *X;
	float *Y;
	float y0, x0, xn, h, f;
	float n;

	printf("Введите у0:\n ");
	fscan(&y0);
	printf("\n Введите x0:\n ");
	fscan(&x0);	
	printf("\n Введите xn:\n ");
	fscan(&xn);
	printf("\n Введите шаг h:\n ");
	fscan(&h);

	if (xn < x0 && h>0 || h > (xn - x0) || xn > x0 && h<0)
	{
		printf("Неверный ввод\n");
	}
	else
	{
		n = (xn - x0) / h;
		X = (float*)malloc(n * sizeof(float));
		Y = (float*)malloc(n * sizeof(float));
		for (int i = 0; i < n + 1; i++)
		{
			X[i] = x0 + i*h;
			if (i == 0)
			{
				Y[i] = y0;
			}
			else
			{
				f = fxy(X[i - 1], Y[i - 1]);
				Y[i] = solve(f, Y[i - 1], h);
			}
		}
		for (int i = 0; i < n + 1; i++)
		{
			printf("\n x%g\t\t %g\t\t y%g\t\t %g\t\t", i, X[i], i, Y[i]);
		}
	}
	_getch();
}