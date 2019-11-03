function y = pol(xS, yS, T)
N = length(xS);
z = ones(N, N);
for i = 1:N
    for j = 1:N
        z(i,j) = xS(i).^(N-j);
    end
end

a = z^-1*yS';

Nn = length(a);
M = length(T);
y = zeros(1, M);
for j= 1:M
    s = 0;
    for i = 1:Nn
        s = s+a(i)*T(j).^(Nn-i);
    end
    y(j)=s;
end
end