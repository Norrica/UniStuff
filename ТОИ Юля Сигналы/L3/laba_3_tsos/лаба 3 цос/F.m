function S = F(t)   
    N = 7;
    S = 1.*(exp(-1/N.*t)).*sin(2*pi*N.*t + 2*pi/N);
end