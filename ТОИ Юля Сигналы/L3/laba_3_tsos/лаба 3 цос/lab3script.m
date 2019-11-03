%% №2 добавляем шум с равномерным законом распределения на интервале с -10^-2 до 10^-2 в цикле 
N = 7;
omega = 2 * pi * N;
T = 2 * pi / omega; %1/N
Ts = 0:(T)/1000:T;
IS = F(Ts);
S1000 = F(Ts);
for i=1:length(S1000)
    S1000(i)=S1000(i)+(-10^(-2)+(10^(-2)+10^(-2))*rand);
end
plot(Ts,S1000,Ts,IS);
%% №3 сглаживанеи сигнала с шумом по семи и девяти точкам
SS7 = slipSmooth(S1000, 3);
SS9 = slipSmooth(S1000, 4);
figure();
plot(Ts,SS7-0.03,Ts,SS9-0.06,Ts,S1000);
zoom on;
grid minor;
legend('7 точек','9 точек', 'Без сглаживания');
%% №4 сглаживание сигнала методом наименьших квадратов 
len = length(S1000);
k = 7;
j = 1;
bufY = [];
bufX = [];
for i = 1:k:len-k+1
y7 = S1000(i:i+k-1); 
x7 = Ts(i:i+k-1);
p2 = polyfit(x7,y7,2); % ищем коэффициенты полинома второй степени 
xx = linspace(x7(1), x7(end),k*100); % генерируем 100 точек, равномерно расположенных на области определения данных 
yy = polyval (p2, xx); % вычисляем в них значения полиномов
bufY = [bufY,yy];
bufX = [bufX,xx];
end
plot (Ts, S1000,'.', bufX, bufY); 
title('Сглаживание сигнала с шумом методом наименьших квадратов '); 
legend ('Точки' , 'Сглаженный сигнал'); 
ylabel ('y'); 
xlabel ('x');
zoom on;
%% № 5
% WhiteN = sqrt(1/N)*rand(1, 1001); % белый шум 
% Noise = var(WhiteN); 
% plot(Ts,Noise);
% Sg = var(slipSmooth(WhiteN, 2)); 
%WhiteNoise = wgn(1,1001, Disp);N = 8;

Disp = 1/N;
WhiteNoise = sqrt(Disp)*randn(1, 1001);
plot (1:1001, WhiteNoise);
Ys = slipSmooth(WhiteNoise, 2);
plot(1:1001, Ys, 1:1001, WhiteNoise);
legend ('Сглаженный белый шум', 'Белый шум с дисперсией');

accFilter = zeros(1, length(1:500)); 
for i = 1:500 
accFilter(i) = var(slipSmooth(WhiteNoise, i)); 
end 
figure; 
plot(1:2:999, accFilter, '.'); 
title('Зависимость результата сглаживания от количества точек'); 
grid on; 
grid minor; 
ylabel('Дисперсия'); 
xlabel('Количество точек аппроксимации');
%% №6
dispInp = var(WhiteNoise);
dispOut = var(Ys);
plot(Ts, IS, Ts, S1000, Ts, SS9)
legend('Идеальный график', 'Сигнал с шумом', 'Сглаженный сигнал по 7 точкам')
title('Графики')
