function P = generalized_least_squares(X,XX)
    G = zeros(5,5);
    for i = 1 : 5
        for j = 1 : 5
            for xi = 1 : length(X)
                G(i,j) = G(i,j) + X(xi) ^ (i - 1) * X(xi) ^ (j - 1);
            end
        end
    end
    D = zeros(5,1);
    for i = 1:5
        for xi = 1 : length(X)
            D(i,1) = D(i,1) + X(xi) ^ (i - 1) / (1 + 25 * X(xi) ^ 2);
        end
    end
    a = D/G;
    A = zeros(1,5);
    for i = 1 : 5
        A(i) = a(6 - i);
    end
    P = zeros(1,length(XX));
    for i = 1 : length(XX)
        P(i) = polyval(A , XX(i));
    end

    
    
    