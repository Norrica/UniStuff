function res = Trap(x,y)
res = 0;
for i = 1:length(x)-1
    res = res + (x(i+1)-x(i))*(y(i)+y(i+1))/2;
end
end