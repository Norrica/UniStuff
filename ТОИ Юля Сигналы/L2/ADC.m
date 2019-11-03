function dig = ADC(Fx,N)
dig = zeros(length(Fx));
h =(max(Fx)-min(Fx))/2^N;
for i=1:length(Fx)
    dig(i)=(floor(Fx(i)/h)+0.5)*h;
end
end