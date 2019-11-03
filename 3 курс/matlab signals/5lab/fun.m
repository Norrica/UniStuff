function res = fun(Ts, N)
res = zeros(1, length(Ts));
for i = 1:length(Ts)
    if (Ts(i) >= 1/N && Ts(i) <= 4/N)
        res(i) = 1;
    end
end
end