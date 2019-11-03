function l = lin(x,y)
    N= length(x);
    l= zeros(1,N);
    l(1:2)=y(1:2);
    for i = 2:N
        a=(y(i)-y(i-1))/(x(i)-x(i-1));
        b=y(i-1)-a*x(i-1);
        l(i)= a*x(i)+b;
    end
end