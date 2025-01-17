// Ряды.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <stdlib.h>
#include <iostream>
#include <math.h>
#include <string>
#include <functional>
using namespace std;
const double pi = 3.141592653589793238463;
double pow[20][20];
double fac[20][20];
double exp[20][20];
double sin[20][20];
double cos[20][20];

double sum(double x, double y)
{
	return x + y;
}
double simple(double x, double y)
{
	return x;
}
double power(double x, double y, double i, double fect)
{
	return x * y;
}
double fact(double fect, double res, double i, double ffect)
{
	return res * i;
}

double sigma(double x, double n, double shag, double sum, double koef, double i, function<double(double, double, double, double)> pf1, function<double(double, double)> pf2)
{
	double k = 1;
	double res = sum;
	for (; i <= n; i+=shag)
	{
		res = pf2(pf1(x, res, i, n), k * res);
		k *= koef;
	}
	return res;
}
double powfact(double x, double res, double i, double n)
{
	return (mem(x, n, 1, 1, 1, 1, power, simple, pow) / mem(x, i, 1, 1, 1, 1, fact, simple, fac));
}
double mem(int x, int n, double shag, double sum, double koef, double i, function<double(double, double, double, double)> pf1, function<double(double, double)> pf2, double arr[20][20])
{
	{
		if (arr[x][n] == -2)
			arr[x][n] = sigma(x, n, shag, sum, koef, i, pf1, pf2);
		return arr[x][n];
	}

}
int main()
{
	for (int i = 0; i < 20; i++)
	{
		for (int j = 0; j < 20; j++)
		{
			pow[i][j] = -2;
			fac[i][j] = -2;
			exp[i][j] = -2;
			sin[i][j] = -2;
			cos[i][j] = -2;
		}
	}
	cout << "e: " << mem(1, 20, 1, 0, 1, 0, powfact, sum, exp) << endl;
	cout << "sin: " << mem(1, 20, 2, 0, -1, 1, powfact, sum, sin) << endl;
	cout << "cos: " << mem(1, 20, 2, 0, -1, 0, powfact, sum, cos) << endl;
	cout << "power: " << mem(3, 4, 1, 1, 1, 1, power, simple, pow) << endl;
	cout << "factorial: " <<mem(4, 4, 1, 1, 1, 1, fact, simple, fac) << endl;
	cout << "power: " << mem(3, 4, 1, 1, 1, 1, power, simple, pow) << endl;
    return 0;
}

