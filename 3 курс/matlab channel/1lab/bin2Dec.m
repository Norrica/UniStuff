function y = bin2Dec(x)
i = 1;
y = 0;
while i <= length(x)
    y = y + 2^(i-1)*x(i);
    i = i + 1;
end
end