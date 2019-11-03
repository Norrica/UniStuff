function res = sq(x, y, side)
msgID = 'sq:BadSide';
msg = 'Unexpected choice of side(left or right, братан)';
baseException = MException(msgID, msg);

res = 0;
if strcmpi(side, 'left')
    for i = 1:length(x)-1
    res = res + y(i)*(x(i+1)-x(i));
    end
elseif strcmpi(side, 'right')
    for i = 1:length(x)-1
    res = res + y(i+1)*(x(i+1)-x(i));
    end
else
    throw(baseException);
end
end