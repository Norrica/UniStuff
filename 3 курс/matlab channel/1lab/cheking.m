TS = Txt2Bit('всем');
snl = length(TS);
for i = 1:snl
    if TS(i) == 1
        TS(i) = 5;
    else
        TS(i) = 0.5;
    end
end
TS = awgn(TS, 10);


plot(1:snl, TS, '-o');
grid on
