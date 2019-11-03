function y = Txt2Bit(x)

z = double(x);
i=1;

y = zeros(1, length(x)*16);
while i<=length(x)
    j = 1;
    buff = DecToBin(z(i));
    while j <= 16
        y((i-1)*16 + j) = buff(j);
        j = j + 1;
    end
    i = i + 1;
end
end
