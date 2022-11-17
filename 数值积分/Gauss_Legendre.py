import math
def Gauss_Legendre(f,n):
    if n == 0:
        I = 2 * f(0)
    if n == 1:
        I = f(-1 / 3 ** 0.5) + f(1 / 3 ** 0.5)
    if n == 2:
        I = 5 / 9 * f(- (15 ** 0.5) / 5) + 8 / 9 * f(0) + 5 / 9 * f((15 ** 0.5) / 5)
    if n == 3:
        I = 0.3478548 * f(-0.8611363) + 0.6521452 * f(-0.3399810) + 0.6521452 * f(0.3399810) + 0.3478548 * f(0.8611363)
    print(I)
    return I


def f(x):
    y = 3 / 2 * 2.718281828459 ** (3 / 2 * x + 5 / 2) * math.sin(3 / 2 * x + 5 / 2)
    return y


Gauss_Legendre(f,3)