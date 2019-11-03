function  SS = slipSmooth(S, N)
len = length (S);
SS = S;
for i = N + 1:len - N
    SS(i) = 0;
    for j = i-N:i+N
        SS(i) = SS(i)+S(j);
    end
    SS(i) = SS(i)/(2*N+1);
end
end

