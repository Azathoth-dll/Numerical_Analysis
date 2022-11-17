function L = my_Lagrange(x,y)
    n = length(x);
    L = zeros(1,n);
    for i=1:n
        v = x([1:i-1,i+1:n]);
        temp = poly(v);
        L = L + temp/polyval(temp,x(i))*y(i);
    end
    