# Y为待积函数
# X_in为[X0,Xn],其中X0为整个区间的左端点,Xn为整个区间的右端点
# n为所分小区间数量


import math

# 复合公式梯形求积分


def Trapezoid_formula(Y, X_in, n):
    X = X_in.copy()
    Length = X[1] - X[0]
    h = Length / n
    # print("h:{}\n".format(h))
    for i in range(1, n):
        X.insert(i, X[0] + h * i)
    y = []
    for i in range(n+1):
        y.append(Y(X[i]))
    # print(y)
    S = y[0] * h / 2
    for i in range(1, n):
        S = S + h * y[i]
    S = S + y[n] * h / 2
    print("复合梯形公式结果:{}".format(S))
    return S

# 复合辛普森公式


def Simpson_formula(Y, X_in, n):
    X = X_in.copy()
    Length = X[1] - X[0]
    h = Length / n
    for i in range(1, n):
        X.insert(i, X[0] + h * i)
    y = []
    for i in range(n+1):
        y.append(Y(X[i]))
    y_half = []
    for i in range(n):
        y_half.append(Y(X[i] + h / 2))
    S = (y[0] + y[n]) * h / 6
    for i in range(1, n):
        S = S + h * y[i] / 3
    for i in range(n):
        S = S + h * y_half[i] * 2 / 3
    print(y)
    print(y_half)
    print("复合辛普森公式:{}".format(S))
    return S


# 2.1
# X = [0, 1]

# def f1(x):
#     y = x / (4 + x ** 2)
#     return y

# Trapezoid_formula(f1,X,6)
# Simpson_formula(f1, X, 6)


# 2.2
# X = [1, 9]

# def f2(x):
#     y = x ** 0.5
#     return y

# Trapezoid_formula(f2,X,6)
# Simpson_formula(f2,X,6)


# 2.3
# X = [0,3.1415926/6]

# def f3(x):
#     y = (4 - ((math.sin(x)) ** 2)) ** 0.5
#     return y

# Trapezoid_formula(f3,X,4)
# Simpson_formula(f3,X,4)


# 4
# X = [0,1]

# def f(x):
#     y = 2.718281828459 ** (-2 * x)
#     return y

# Simpson_formula(f,X,1)