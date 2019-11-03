function y = MAfiltering(y,N)
N = (N-1)/2;
for i = 1+N:length(y)-N
    t = 0;
    for k = -N:N
        t = t+y(i+k);
    end
    y(i) = t/(2*N+1);
end
end