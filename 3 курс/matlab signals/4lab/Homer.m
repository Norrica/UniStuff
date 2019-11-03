function res = Homer(x,y)
res = 0;
for i =1:length(x)-1
    res = res + ((x(i+1)-x(i))*(y(i)+2*(y(i+1)+y(i))+y(i+1)))/6;
end

end