function res = dif1(xs, ys)
dx = xs(2) - xs(1);
i = 1:length(ys) - 1;
res = i;
res(i) = (ys(i+1) - ys(i)) / dx;
end