%2
N = 18;
T = 1/N;
Ts = 0:4*T/1000:4*T;
noise = Ts;
%шум
for i = 1: length(Ts)
    noise(i) = -0.01 + 0.02 * randn;
end
%создание затухающего сигнала
f = fadings(1, Ts);
%зашумление сигнала
result = f + noise;
%%
%приближение данных первым способом
accFirst = zeros(1, length(1:2:999));
for i = 1:2:999
    accFirst((i+1)/2) = var(f - MAfiltering(result, i));
end
figure;
plot(1:2:999, accFirst, 'o');
title('Зависимость результата сглаживания от количества точек');
%%
accMA7 = accFirst(4);
accMA9 = accFirst(5);
y7 = OLSfiltering(Ts, result, 7);
accOLS7 = var(f - y7);
y9 = OLSfiltering0(Ts, result, 9);
accOLS9 = var(f - y9);
%%
WhiteN = sqrt(1/N)*randn(1, 1001);
var(WhiteN)
var(MAfiltering(WhiteN, 5))
accFilter = zeros(1, length(1:2:999));
for i = 1:2:999
    accFilter((i+1)/2) = var(MAfiltering(WhiteN, i));
end
figure;
plot(1:2:999, accFilter, 'o');
title('Зависимость результата сглаживания от количества точек');
grid on;
grid minor;
ylabel('Диспесия');
xlabel('Количество точек апроксимации');
[val, idx] = min(accFilter);
idx = idx*2-1;
%%
accFilterM = zeros(1, length(1:2:999));
for i = 1:2:999
    accFilterM((i+1)/2) = mean(WhiteN) - mean(MAfiltering(WhiteN, i));
end
figure;
plot(1:2:999, accFilterM, 'o');
title('Зависимость результата сглаживания от количества точек');
grid on;
grid minor;
ylabel('Разница среднего значения шума');
xlabel('Количество точек апроксимации');
[valM, idxM] = min(accFilterM);
idxM = idxM*2-1;