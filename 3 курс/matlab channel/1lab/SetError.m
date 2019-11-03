function y = SetError(mT, N)
s = ' ':'~';
i=1;
if (N > length(mT))
    N = length(mT);
end
while i<=N
    mT(i)=(s(randi(94, 1, 1)));
    i=i+1;
end
y=mT;
end