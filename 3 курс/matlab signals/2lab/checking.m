t16 = 0: 1/448: 1/14;
z = ones(5, 5);
for i = 1:5
    for j = 1:5
        z(i,j) = i^j;
    end
end
z = z.^2
