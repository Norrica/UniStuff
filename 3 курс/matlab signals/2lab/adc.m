function res = adc(xS, yS, N)
res = zeros(1, length(xS));
h = (max(yS) - min(yS)) / 2.^N;
for i = 1 : length(xS)
    res(i) = floor(yS(i)/h + 0.5) * h;
end