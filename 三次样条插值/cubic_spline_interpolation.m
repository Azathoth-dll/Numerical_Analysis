function P = cubic_spline_interpolation(x,y,b)
    n = length(x) - 1;
    h = x(2:n+1) - x(1:n);
    mu_p = h(1:n-1)./(h(1:n-1) + h(2:n));
    mu = [mu_p 1];
    lambda_p = h(2:n)./(h(1:n-1) + h(2:n));
    lambda = [1 lambda_p];
    delta = (y(2:n+1) - y(1:n))./h(1:n);
    d_p = 6*(delta(2:n) - delta(1:n-1))./(h(1:n-1) + h(2:n));
    d = [6*(delta(1) - b(1))/h(1) d_p 6*(b(end) - delta(end))/h(n)];
    
    A = eye(n+1).*2;
    
    for i = 1:n
        A(i,i+1) = lambda(i);
        A(i+1,i) = mu(i);
    end
    
    M = A\(d');
    P = zeros(n,4);
    
    for i = 1:n
       c1 = M(i)/(6*h(i));
       c2 = M(i+1)/(6*h(i));
       c3 = (y(i)-M(i)*(h(i)^2)/6)/h(i);
       c4 = (y(i+1) - M(i+1)*(h(i)^2)/6)/h(i);
       P(i,1) = -c1 + c2;
       P(i,2) = 3*(x(i+1)*c1 - x(i)*c2);
       P(i,3) = 3*(-(x(i+1)^2)*c1 + (x(i)^2)*c2) - c3 + c4;
       P(i,4) = c1*(x(i+1)^3) - c2*(x(i)^3) + x(i+1)*c3 - x(i)*c4;
    end
    
    