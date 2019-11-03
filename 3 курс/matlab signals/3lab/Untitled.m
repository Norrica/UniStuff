A = [1 0 0; 0 1 0; 0 0 1];
B = 0 + (0 + 1)*rand(3,3);
C = mtimes(A,B);
D = sort (A);
E = transpose(B);
F = inv(B);
[G, H] = max(B(:));[I,J] = min(B(:));
Det = det(B);

x = A\C;
DD = abs(sin(A)+B.^(3/5));
i= -3+(3+3)*rand(1,3); j= -3+(3+3)*rand(1,3);
k=dot(i,j)
l= cross(i,j)
mi=sqrt(