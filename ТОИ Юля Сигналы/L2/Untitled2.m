Fd=0.005;
Ts=0.08;
t=0:0.005:0.08;
tt=0:0.00001:0.08;
% plot(t,F(t));
plot(t,F(t),'b');
hold on;
plot(tt,F(tt),'r');
hold off;
% subplot(1,2,1); plot(t,F(t),'b');
% subplot(1,2,2); plot(tt,F(tt),'r');
disp(F(t));
% grid();
%%
lin(0,F(0),0.0025,0.005,F(0.005));
%% Временная сетка Ts/200
y=F(t);
t2 = 0:Ts/200:0.08;
%%
lag(t,y,t2);
%%
newt(t,y,t2);
%%
sspline(t,y,t2);
%%
subplot(3,1,1);plot(t,F(t),t2,lag(t,y,t2));
subplot(3,1,2);plot(t,F(t),t2,newt(t,y,t2));
subplot(3,1,3);plot(t,F(t),t2,sspline(t,y,t2));
%%
g=0:Ts/1000:Ts;
% plot(g,F(g));
h=ADC(F(g),14);
% stairs(g,h);






