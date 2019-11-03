function l = lin(x0,y0,t,x1,y1)
    l = y0+((y1-y0)/(x1-x0))*(t-x0);
end