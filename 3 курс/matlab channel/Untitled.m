A = zeros(1,500);
B = ones(1,500);
C = A;
i = 2;
while i < 501
   C(i) = 1;
   i = i+2;
end

s = ' ':'~';
qstr = (s(randi(94, 70, 1)));

BitSeq = Txt2Bit('gggggggggg');
TxtSeq = bit2Txt(BitSeq);
TxtSeq2 = 'Hello!you.';
BitSeq2 = Txt2Bit(TxtSeq2);
berCalc(BitSeq,BitSeq2);
serCalc(TxtSeq,TxtSeq2);

ds = fileread('ny.txt');

fid = fopen('ny.txt','wt');
fwrite(fid, TxtSeq2);
fclose(fid);

SetError(TxtSeq,0);
%10. Матрица состояний шумов
mOfStates = [0 1.5 0.2
            0.25 0.3 0.5
            0.4 0.5 2];
txt = 'Someone once told i need to face fear to get over it';
fromL = 0:0.01:20;
    %i = 1:length(fromL)
            
    fromL = berCalc(channel(Txt2Bit(txt),...
        mOfStates, 0.3, 0, 20, 0, 0), Txt2Bit(txt))%channel(TS, P, A, dT, L, IS, N)


%11. 14 Оптоволокно 0,35 дБ на 1 км 3 км, 100 км, 1000 км
%12. Прохождение сигнала по каналу связи с шумом, задержкой и ослаблением
% fft(rand(1,10))
% channel([5 7 3 4 4 9 3 1], mOfStates, 0.3, 0, 3, 0.2, 