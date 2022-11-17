x = -5:1:5;
y = sin(x);
N = my_Newton(x,y);
L = my_Lagrange(x,y);
t = linspace(-5,5,1001);
s = sin(t);
r1 = polyval(N,t);
r2 = polyval(L,t);
figure;
hold on;
plot(t,s,':r');
plot(t,r1,'-.b');
plot(t,r2,'-k');
plot(x,y,'g+');
legend(('sin(x)'),('Newton'),('Lagrange'),('points'))