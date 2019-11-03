function y = OLSfiltering0(xS, yS, N, qwe)
y = zeros(1, length(yS));
vx = zeros(N, 1);
vy = vx;
n = (N-1)/2;
xS = xS';
yS = yS';
l = length(xS);
for i = 1:n
    y(i) = yS(i);
end
for i = l-n+1:l
    y(i) = yS(i);
end
    
for i = 1+n:l-n
    for j = 1:N
        vx(j) = xS(i-(N+1)/2+j);
        vy(j) = yS(i-(N+1)/2+j);
    end
    D = vx.^0;
    Coeff = D\vy;
    p = length(Coeff);
    for k = 1:p
        y(i) = y(i) + Coeff(k)*xS(i)^(p-k);
    end
end
end