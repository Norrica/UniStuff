/*var a, b, c, d, f, g:integer;
var e : real;
begin
read(a, b, d);
while a<>0 do begin
g : = 0;
e: = 0;
while (a mod 10 <>0) or (a div 10 <>0) do begin
c : = a mod 10;
e: = e + c*exp(ln(b) * g);
a: = a div 10;
inc(g);
end;
f: = round(e);
while f div d<>0 do begin
writeln(f mod d);
f: = f div d;
end;
writeln(f mod d)
end;
end.*/


#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
	int a=0, b=0, c=0, d=0, e=0, f=0, g=0;

	scanf_s("%d", &a);
	scanf_s("%d", &b);
	scanf_s("%d", &d);
	puts("\n");
	while (a != 0)
	{
		g = 0;
		e = 0;
		while (a % 10 != 0 || a / 10 != 0)
		{
			c = a % 10;
			e += c * pow(b, g);
			a /= 10;
			g++;
		}
		f = e;
		while (f / d != 0)
		{
			printf("%d\n", f % d);
			f /= d;
		}
		printf("%d\n", f % d);
	}
	_getch();	
}