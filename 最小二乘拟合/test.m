X = [-1 -0.8 -0.6 -0.4 -0.2 0.0 0.2 0.4 0.6 0.8 1.0];
XX = linspace(-1,1,1000);
Y = zeros(1,1000);
for i = 1 : 11
    Y(i) = 1 / (1 + 25 * (XX(i) ^ 2));
end
P = generalized_least_squares(X,XX);
figure
hold on
plot(XX,Y,'--ro');
plot(XX,P,'-.b*')