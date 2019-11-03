function res = func(A,t)
N = 28;
om = 2*pi*N;
fi = 2*pi/N;
res = A.*cos(om*t+fi);
end