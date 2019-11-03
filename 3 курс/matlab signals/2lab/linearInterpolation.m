function y = linearInterpolation(x, xS, yS)

first = 1;
second = 2;
i = 1;

while i <= length(xS)
    if x < xS(i)
    second = i;
    break;
    end
    i = i + 1;
end

if second == 1
    second = 2;
end

if second == 2 && i == length(xS)+1
    second = length(xS);
end
first = second - 1;

y = yS(first) + ((yS(second)-yS(first))*(x - xS(first)))/(xS(second)-xS(first));

end