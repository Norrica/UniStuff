function  S = LSM(X, Y, N)
len = length (Y);
S = Y;
for i = 1:len
    for j = i:(N*2)+1
        Y2(j) = Y(j); 
        X2(j) = X(j);
    end
    %D = [X2.^2 X2 1./(X2+1)]
    %Coeff = D\Y2
    Coeff = polyfit(X2,Y2,2);
    Ts = min(X2):1.25e-04:max(X2);
    S = [ones(size(Ts')) Ts' Ts'^2]*Coeff;
end
end