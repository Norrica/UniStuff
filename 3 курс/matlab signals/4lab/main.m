%1,2
base = 1/28;
N = 28;
Ta = 0:20/(28*1000000):20/28;
fa = func(1, Ta);
integra = Homer(Ta, fa);

T2 = 0:base/2:20/28;
f2 = func(1, T2);

T4 = 0:base/4:20/28;
f4 = func(1, T4);

T8 = 0:base/8:20/28;
f8 = func(1, T8);

T16 = 0:base/16:20/28;
f16 = func(1, T16);

%% 3 1.536552068751e-17
trying = sq(T2, f2, 'right');
om = 2*pi*N;
fi = 2*pi/N;
fun = @(x) cos(om*x+fi);
fplot(fun, [0 20/28])
hold on;
plot(T16,f16);
integ = integral(fun, 0, 20/28);
integ1 = Homer(T16, f16);
%% 4
Ts = 0:20/(28*1000):20/28;
f = func(1, Ts);

wSqR = zeros(1,length(Ts));
wSqL = wSqR;
wTrap = wSqR;
wHomer = wSqR;
wReal = wSqR;

for i = 1:length(Ts)
    wSqR(i) = sq(Ts(1:i), f(1:i), 'right');
end
for i = 1:length(Ts)
    wSqL(i) = sq(Ts(1:i), f(1:i), 'left');
end
for i = 1:length(Ts)
    wTrap(i) = Trap(Ts(1:i), f(1:i));
end
for i = 1:length(Ts)
    wHomer(i) = Homer(Ts(1:i), f(1:i));
end
% for i = 1:length(Ts)-1
%     wReal(i) = Homer(Ta(1:i*1000), fa(1:i*1000));
% end

for i = 0:length(Ts)-1
    wReal(i+1) = integral(fun, 0, i*20/28000);
end
figure;
plot(Ts, wReal)
hold on
plot(Ts, wHomer, '--')
%% 5
d1 = dif1(T16, f16);

d2 = dif2(T16, f16);

d3 = diff(f)/(Ts(2)-Ts(1));
figure;
plot(T16(1:320), d1);
hold on;
plot(T16(1:319), d2);
hold on;
plot(Ts(1:1000), d3);
legend('diff1','diff2','original');