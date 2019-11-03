function y = unite(in, n, from)
y = in;
for i = 1 : length(from)
    y(n, i) = from(i);
end
end