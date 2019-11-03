function y = nextState(pS, P)% P - matrix
body = size(P);

convert = zeros(1, body(1,1) * body(1,2));

for i = 1:body(1,1)
    for j = 1:body(1,2)
        convert((i-1)*body(1,1) + j) = P(i, j);
    end
end
N = length(convert);
R = floor(-N + (2*N+1) * rand);
index = 0;
for i = 1:N
    if pS == convert(i)
        index = i + R;
        if index > N
            y = convert(index - N);
        elseif index < 1
            y = convert(index + N);
        else
            y = convert(index);
        end
    end
end
end