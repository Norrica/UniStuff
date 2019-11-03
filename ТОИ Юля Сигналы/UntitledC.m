A=rand(1,100);
i=2;
while i<=100
    A(i) = 0;
    i = i + 2;
end
disp(A);

%ln(1.45)+k*ln(0.92)
B=0;
for k=1:15
    B=B+log(1.45)+k*log(0.92);
end
disp(B);

%y = exp(-x.^2);
figure; 
fplot('exp(-x.^2)', [0 4*pi]); 
grid on;
title ('Функция y = exp(-x^2)');
xlabel('x');
ylabel('y');
legend();

Z = peaks;
surf(Z)
axis tight
axis([0 40 0 40 -20 20])
set(gca,'nextplot','replacechildren')
f = getframe(gca);
[im,map] = rgb2ind(f.cdata,256);
im(:,:,1,20) = im;
for k = 1:20
  surf(Z*cos(k))
  f = getframe(gca);
  im(:,:,1,k) = rgb2ind(f.cdata,256);
end
imwrite(im,map,'test.gif','DelayTime',0,'LoopCount',inf)