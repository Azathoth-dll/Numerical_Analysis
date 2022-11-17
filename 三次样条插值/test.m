n = 10;
%n = 20;
x = -1:2/n:1;
y = 1./(1 + 25*(x.^2));
b = [-50*(-1)/((1 + 25*(-1)^2)^2) -50*(1)/((1 + 25*(1)^2)^2)];
L = lagrange(x,y);
s = cubic_spline_interpolation(x,y,b);
t = linspace(-1,1,n+1);
u = 1./(1 + 25*(t.^2));
v = polyval(L,t);
k = 1000;
w = zeros(n,k);
t_n = zeros(k*n,1);
w_n = zeros(k*n,1);
for i = 1:n
    t_ = linspace(x(i),x(i+1),k);
    w(i,:) = polyval(s(i,:),t_);
    for j = 1:k
        t_n(k*(i-1)+j) = t_(j);
        w_n(k*(i-1)+j) = w(i,j);
    end
end
figure 
plot(t,u,'r--');
hold on,
plot(t,v,'b:');
plot(t_n,w_n,'o-.');
%plot(t,w,'o^');
plot(x,y,'g+');
legend('f(x)','L','Three','t');