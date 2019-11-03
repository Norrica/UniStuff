function res = dif2(xs, ys)
dx = xs(3) - xs(1);
i = 1:length(ys) - 2;
res = i;
res(i) = (ys(i+2) - ys(i)) / dx;
end