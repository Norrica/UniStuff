function res = HR(x,y)
res = zeros(1,length(x));

for i = 1:length(x)
    res(i) = integral(fun,0,x(i));
end

end