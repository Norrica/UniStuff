function [yy, C] = sspline(x, y, xx)

% ¬ходные аргументы
%    x, y Ц узлы интерпол€ции
%    xx Ц значени€ аргумента, дл€ которых надо вычислить кубический сплайн
%  ¬ыходные аргументы  
%    yy Ц значени€ сплайна в xx
%    — Ц матрица коэффициентов кубических полиномов

n = length(x);

x = x(:);
y = y(:);

[d, c, b, a]  = CalcCoeffs(x, y);
C = [d c b a];
yy = zeros(size(xx));

for k = 1:n-1
    ind = find((xx >= x(k)) & (xx<= x(k+1)));
    yy(ind) = a(k) + b(k)*(xx(ind)-x(k)) + ...
        c(k)*(xx(ind)-x(k)).^2 + d(k)*(xx(ind)-x(k)).^3;
end
end
function [d, c, b, a]  = CalcCoeffs(x, y)
% подфункци€ дл€ вычислени€ коэффициентов полиномов кубического сплайна
n = length(x);
h = diff(x);
alpha = 1./h(2:n-2);
beta = 2* (1./h(1:n-2) + 1./h(2:n-1));
gamma = 1./h(2:n-2);
D3 = [[alpha; 0] beta [0; gamma]];
A = spdiags(D3, [-1 0 1], n-2, n-2);
df = diff(y)./h;
delta = 3*(df(2:n-1)./h(2:n-1) + df(1:n-2)./h(1:n-2));
b = A\delta;
b = [0; b; 0];
a = y(1:n-1);
c = (3*df - b(2:n) - 2*b(1:n-1))./h;
d = (b(1:n-1) + b(2:n) - 2*df)./h.^2;
b(end) = [];
end