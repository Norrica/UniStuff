function TS = channel(TS, P, A, dT, L, IS, N, powerUp)
snl = length(TS);
check = TS;
o = 1;
l = 5*powerUp;
koef = 1 / (10^(A*L/20));
%���� � ��������
for i = 1:snl
    if TS(i) == 1
        TS(i) = l;
    else
        TS(i) = o;
    end
end

%�������� �������
PsignalOrigin = 10*log10((sum(TS.^2))/snl);
TS = TS.*koef;
Psignal = 10*log10((sum(TS.^2))/snl);
%������ ����� ���������� � ������� �� 8 ���������
Pnoise = IS;
for i = 1:snl/8
    SNR = Psignal / Pnoise;
    Pnoise = nextState(Pnoise, P);
    TS(i*8-7:i*8) = awgn(TS(i*8-7:i*8), SNR, Psignal);
end
%�������������� ����� 1 ���� �������� ���� 3.4
for i = 1:snl
    if TS(i) >= (o+l)/2
        TS(i) = 1;
    else
        TS(i) = 0;
    end
end
%plot(1:snl, TS);

end