function y = bit2Txt(x)

y = char(bin2Dec(x(1:16)));

i = 2;

while i <= length(x)/16
    z = x((i-1)*16+1:i*16);
    decimal = bin2Dec(z);
    symbol = char(decimal);
    y = char(y, symbol);
    i = i + 1;
end
y = y.';
end