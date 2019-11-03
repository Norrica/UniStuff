function y = DecToBin(x)
y = zeros(1,16);
i=1;  
while (x/2~=0 && i~=16)
    y(i)=mod(x,2);
    x=floor(x/2);
    i = i + 1;
end
end