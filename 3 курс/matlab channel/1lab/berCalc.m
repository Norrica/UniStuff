function y = berCalc(tS, rS)
j = 0;
i = 1;
while i <= length(tS)
    if tS(i)~=rS(i)
        j = j + 1;
    end
    i = i+1;
end
y = j/length(tS);
end