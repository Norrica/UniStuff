function res = fadings(A,t)
N = 18;
om = 2*pi*N;
fi = 2*pi/N;
a = 1/N;
res = A*exp(-a*t).*sin(om*t+fi);
end