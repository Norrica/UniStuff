 %1
x = 0: pi/20 : 4*pi;
% 
%2
y = exp(-x.^2);
z = atan(x.^1/2);

%3
%% figure; 
fplot('exp(-x.^2)', [0 4*pi]); 
grid on;
title ('Функция y = exp(-x^2)');
xlabel('x');
ylabel('y');
legend();

figure; 
fplot('atan(x.^1/2)', [0 4*pi]); 
grid on;
title ('Функция z = arctg(x^1^/^2)');
xlabel('x');
ylabel('y');
legend();
%%
% 4
figure;
y1 = exp(-x.^2); 
subplot(2,1,1), plot(x,y1); grid on;
axis tight
xlabel('x');
ylabel('y');

y2 = atan(x.^(1/2));
subplot(2,1,2) , plot(x,y2); grid on;
axis tight
xlabel('x');
ylabel('y');
%%
% 6
figure;
fplot ('(atan(x^(1/2)))', [0 4*pi], 'c-x')
hold on
fplot ('exp(-x^2)', [0 4*pi], 'k-.*')
xlabel('x');
ylabel('y');
title ('Две функции в рамках одних осей');
axis tight
grid on
text(1.25, 0.4, '\leftarrow Это функция y(x)', 'Color', 'g', 'FontSize', 20)
legend('Location', 'best');
%%
%9
figure;
a=10;
b=18;
[X,Y] = meshgrid(-10:0.5:10, -10:0.5:10);
Z = Y.^2/b.^2 - X.^2/a.^2;
mesh(X,Y,Z);
xlabel('x');
ylabel('y');
zlabel('z')
%%
%1
Hundred = 0 + 100 * rand(1, 100);
i = 2;
while i < 101
    Hundred(i) = 0;
    i = i + 2;
end
%%
% 2
a=1.45;
b=0.92;
z = 0;

for k = 1:10
    z = z + cos(a*k)+sin(b);
end

% 3
figure;
y = exp(-x);
plot(x,y)
axis([0 4*pi 0 1])
f = getframe;
[im,map] = rgb2ind(f.cdata,256);
im(1,1,1,100) = 0;
for k = 1:100
  y = exp(-x.^(k/50));
  plot(x,y)
  axis([0 4*pi 0 1])
  f = getframe;
  im(:,:,1,k) = rgb2ind(f.cdata,map); 
end


%%
figure;
Z = peaks(10);
surf(Z)
axis tight
axis([0 10 0 10 -10 10])
set(gca,'nextplot','replacechildren')
f = getframe(1);
[im,map] = rgb2ind(f.cdata,256);
im(:,:,1,200) = im;
for k = 1:200
  surf(Z*10*sin(k/10))
  f = getframe(1);
  im(:,:,1,k) = rgb2ind(f.cdata,256);
end