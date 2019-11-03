N = 28; %сюда вставить свой вариант
%отсчеты
t2 = 0: 1/56: 1/14;%2 отчета на период сигнала
t4 = 0: 1/112: 1/14;%4
t8 = 0: 1/224: 1/14;%8
t16 = 0: 1/448: 1/14;%16
%значения
f2 = sin((2*pi*N*t2)+((2*pi)./N));
f4 = sin((2*pi*N*t4)+((2*pi)./N));
f8 = sin((2*pi*N*t8)+((2*pi)./N));
f16 = sin((2*pi*N*t16)+((2*pi)./N));
x = 0:1/14000: 1/14;
y = sin((2*pi*N*x)+((2*pi)./N));
%%
figure;%2 отсчета
plot(t2, f2, '-*');
axis ([0 1/14 -1 1]);
hold on
%fplot(@(t)sin((2*pi*N*t)+((2*pi)./N)));
plot(x, y);
legend('Дискретный','Непрерывный');
title('Сигнал с 2-я отсчетами');
xlabel('t');
ylabel('f(t)');

figure;%4
plot(t4, f4, '-*');
axis ([0 1/14 -1 1]);
hold on
%fplot(@(t)sin((2*pi*N*t)+((2*pi)./N)));
plot(x, y);
legend('Дискретный','Непрерывный');
title('Сигнал с 4-я отсчетами');
xlabel('t');
ylabel('f(t)');

figure;%8
plot(t8, f8, '-*');
axis ([0 1/14 -1 1]);
hold on
%fplot(@(t)sin((2*pi*N*t)+((2*pi)./N)));
plot(x, y);
legend('Дискретный','Непрерывный');
title('Сигнал с 8-ю отсчетами');
xlabel('t');
ylabel('f(t)');

figure;%16
plot(t16, f16, '-*');
axis ([0 1/14 -1 1]);
hold on
%fplot(@(t)sin((2*pi*N*t)+((2*pi)./N)));
plot(x, y);
legend('Дискретный','Непрерывный');
title('Сигнал с 16-ю отсчетами');
xlabel('t');
ylabel('f(t)');
%%
%отсчеты для интеполирования
T = 0 : 1/2800 :1/14;

line2 = zeros(1, length(T));
new2 = line2;
lagr2 = line2;

line4 = line2;
new4 = line2;
lagr4 = line2;

line8 = line2;
new8 = line2;
lagr8 = line2;

line16 = line2;
new16 = line2;
lagr16 = line2;
%значения после интерполяции
for i = 1 : length(T)
    line2(i) = linearInterpolation(T(i), t2, f2);
    line4(i) = linearInterpolation(T(i), t4, f4);
    line8(i) = linearInterpolation(T(i), t8, f8);
    line16(i) = linearInterpolation(T(i), t16, f16);
    
    new2(i) = newton(T(i), t2, f2);
    new4(i) = newton(T(i), t4, f4);
    new8(i) = newton(T(i), t8, f8);
    new16(i) = newton(T(i), t16, f16);
    
    lagr2(i) = lagrange(T(i), t2, f2);
    lagr4(i) = lagrange(T(i), t4, f4);
    lagr8(i) = lagrange(T(i), t8, f8);
    lagr16(i) = lagrange(T(i), t16, f16);
end

spl2 = spline(t2, f2, T);
spl4 = spline(t4, f4, T);
spl8 = spline(t8, f8, T);
spl16 = spline(t16, f16, T);

pol2 = pol(t2, f2, T);
pol4 = pol(t4, f4, T);
pol8 = pol(t8, f8, T);
pol16 = pol(t16, f16, T);

%сверка
vq = interp1(t2, f2, T);

figure;
plot(T, line2, '*');
axis ([0 1/14 -1 1]);
hold on
plot(T, vq, 'o');
title ('Кубический сплайн-интерполяция для 16 отсчетов');
xlabel('t');
ylabel('f');

f = sin((2*pi*N*T)+((2*pi)./N));
%%
%проверка точности
accLine = zeros(1,4);
accNew = accLine;
accLagr = accLine;
accSpl = accLine;
accPol = accLine;

accLine(1) = mean(abs(f-line2));
accLine(2) = mean(abs(f-line4));
accLine(3) = mean(abs(f-line8));
accLine(4) = mean(abs(f-line16));

accNew(1) = mean(abs(f-new2));
accNew(2) = mean(abs(f-new4));
accNew(3) = mean(abs(f-new8));
accNew(4) = mean(abs(f-new16));

accLagr(1) = mean(abs(f-lagr2));
accLagr(2) = mean(abs(f-lagr4));
accLagr(3) = mean(abs(f-lagr8));
accLagr(4) = mean(abs(f-lagr16));

accSpl(1) = mean(abs(f-spl2));
accSpl(2) = mean(abs(f-spl4));
accSpl(3) = mean(abs(f-spl8));
accSpl(4) = mean(abs(f-spl16));

accPol(1) = mean(abs(f-pol2));
accPol(2) = mean(abs(f-pol4));
accPol(3) = mean(abs(f-pol8));
accPol(4) = mean(abs(f-pol16));
%%
%цифровой сигнал
Tsuperb = 0 : 1/14000 :1/14;
fSuperb = sin((2*pi*N*Tsuperb)+((2*pi)./N));

n = 6;
digitS = adc(Tsuperb, fSuperb, n);

figure;
stairs(Tsuperb, digitS);
grid on 
grid minor
axis ([0 1/14 -1 1]);
txt = ['Цифровой сигнал ' num2str(n) ' разряда'];
title (txt);
xlabel('t');
ylabel('f');
%%
%шум
noise = fSuperb - digitS;
figure;
plot(Tsuperb, noise);
axis tight;
title('Шум');
%свойства шума
v = var(noise);
s = std(noise);

%%
lineSpace = [2 4 8 16];
figure;
plot(lineSpace, accLine);
title('Линейная');
figure;
plot(lineSpace, accPol);
title('Полином н-ой степени');
xlim([2 8])

figure;
plot(lineSpace, accNew);
title('Формула Ньютона');
figure;
plot(lineSpace, accLagr);
title('Полином Лагранжа');
figure;
plot(lineSpace, accSpl);
title('Кубический сплайн');



