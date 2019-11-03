function dig = ADC(x,Fx,N)
dig=zeros(1,length(Fx));
h=(max(Fx)- min(Fx))/2.^N;
for i=1:length(x)
    dig(i)=floor((Fx(i)/h)+0.5)*h;
end
