import math
import numpy
from Trapezoid_Simpson import Trapezoid_formula

def Romberg(X,Y,delta):
    T = []
    k = 0
    while(1):
        Ti = []
        Ti.append(Trapezoid_formula(Y,X,2 ** k))
        for m in range(1,k + 1):
            Ti_m = 4 ** m / (4 ** m - 1) * Ti[m - 1] - 1 / (4 ** m - 1) * T[k - 1][m - 1]
            Ti.append(Ti_m)
        T.append(Ti.copy())
        if((abs(T[k][k] - T[k - 1][k - 1]) < delta) and (k > 0)):
            break
        k = k + 1
    for x in T:
        print("{}\n".format(x))
    return T
    

# 8.1
# X = [0,1]
# def y(x):
#     y = 2 / 3.1415926 ** 0.5 * 2.718281828459 ** (-2 * x)
#     return y


# 8.2
# X = [0,6.2831852]
# def y(x):
#     y = (x ** 2) * math.sin(x)
#     return y


# 8.3
X = [0,3]
def y(x):
    y = x * (1 + 2 * x ** 2) ** 0.5
    return y


# in
delta = 1e-5
Romberg(X,y,delta)