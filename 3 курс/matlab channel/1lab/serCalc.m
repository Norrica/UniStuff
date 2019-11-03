function y = serCalc(tT, rT)
j = 0;
i = 1;
while i <= length(tT)
    if tT(i)~=rT(i)
        j = j + 1;
    end
    i = i+1;
end
y = j/length(tT);
end