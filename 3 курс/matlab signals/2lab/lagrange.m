function y = lagrange(x, xS, yS)
i = 1;
j = 1;
y = 0;
bazis = 1;
while i <= length(xS)
    while j <= length(xS)
        if i~=j
            bazis = bazis * (x - xS(j))/(xS(i)-xS(j));
        end
        j = j+1;
    end
    y = y + yS(i) * bazis;
    bazis = 1;
    j = 1;
    i = i+1;
end