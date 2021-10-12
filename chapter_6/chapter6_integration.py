# -*- coding: utf-8 -*-
"""
Author: Paschalis Giakoumoglou
Date: Thu Jun 17 23:29:08 2021
"""

import matplotlib.pyplot as plt
import numpy as np
import math
import sympy as symb
from autograd import grad
import autograd

def print_derivatives(degree):
    print("Function and its derivatives:")
    x = symb.Symbol('x')
    y = x*symb.log(x)
    print(f"> Initial function = {y}")
    for i in range(1, degree+1):
        print(f"> Derivative {i} = {y.diff(x, i)}")
    return y

def f(x):
    return x**3

def find_max_grad_f(f, degree, a, b):
    ff =  f
    for _ in range(degree):
        ff = grad(ff)
    x = np.linspace(a,b,1000)
    ffx = [ff(float(i)) for i in x]    
    return max(ffx)

def rect_left(f, a, b, N):
    print("Rectangle Left Method")
    h = (b-a)/N
    print(f"a = {a}, b = {b}, N = {N}")
    print(f"h = (b-a)/N = {h}")
    tot = 0
    for i in range(N):
        tot += f(a+i*h)
        print(f"f({a+i*h}) = {f(a+i*h)}")
    print(f"I = h*sum[f(x_i)] = {tot*h}")
    error = h/2*(b-a)*find_max_grad_f(f, 1, a, b)   
    print(f"E = h/2*(b-a)*max(f'(x)) = {error}")
    print_derivatives(1+1)
    print()
    #return tot*h
 
def rect_right(f, a, b, N):
    print("Rectangle Right Method")
    h = (b-a)/N
    tot = 0
    for i in range(N):
        tot += f(a+i*h+h)
        print(f"f({a+i*h}) = {f(a+i*h)}")
    print(f"I = h*sum(f(a+i*h+h)) = {tot*h}")
    print()
    #return tot*h

def trapezoid(f, a, b, N):
    print("Trapezoidal Method")
    h = (b - a) / N
    print(f"a = {a}, b = {b}, N = {N}")
    print(f"h = (b-a)/N = {h}")
    tot = f(a)+f(b)
    print(f"f({a}) = {f(a)}")
    for i in range(1, N):
        tot += 2 * f(a + i * h)
        print(f"f({a+i*h}) = {f(a+i*h)}")
    print(f"f({b}) = {f(b)}")
    print(f"I = (h/2) * [f(x0) + 2f(x1) + 2f(x2) + ... + 2f(xN-1) + f(xN)] = {(h / 2) * tot}")
    error = (h**2)*(b-a)*find_max_grad_f(f,2,a,b)/12
    print(f"E = (h^2/12) * (b-a) * max(f''(x)) = {error}")
    print_derivatives(2+1)
    print()
    #return (h / 2) * tot

def simpson(f, a,b,N):
    print("Simpson's Method")
    print("N must be a multitude of 2")
    h = (b-a)/N
    print(f"a = {a}, b = {b}, 2N = {N}")
    print(f"h = (b-a)/N = {2*h}")
    tot = f(a) + f(b)
    print(f"f({a}) = {f(a)}")
    for i in range(1,N,1):
        tot += f(a+i*h)*(2*(i%2 == 0) + 4*(i%2 == 1))
        print(f"f({a+i*h}) = {f(a+i*h)}")
    print(f"f({b}) = {f(b)}") 
    print(f"I = (h/6) * [f(x0) + 4f(x1) + 2f(x2) + 4f(x3) + 2f(x4) + ... + 2f(x2N-2) + 4f(x2N-1) + f(x2N)] = {(h / 3) * tot}")
    error = (h**2) * (b-a) * find_max_grad_f(f,4,a,b) / 180
    print(f"E = ((h/2)^4/180) * (b-a) * max(f''''(x)) = {error}")
    print_derivatives(3+1)
    print()
    #return tot*h/3

def simpson38(f, a,b,N):
    print("Simpson's Method")
    print("N must be a multitude of 3")
    h = (b-a)/N
    print(f"a = {a}, b = {b}, N = {N}")
    print(f"h = (b-a)/N = {h}")
    tot = f(a) + f(b)
    print(f"f({a}) = {f(a)}")
    for i in range(1,N,1):
        tot += f(a+i*h)*(2*(i%3 == 0) + 3*(i%3 != 0))
        print(f"f({a+i*h}) = {f(a+i*h)}")
    print(f"f({b}) = {f(b)}") 
    print(f"I = (h/6) * [f(x0) + 3f(x1) + 3f(x2) + 2f(x3) + 3f(x4) + ... + 3f(xN-2) + 3f(xN-1) + f(xN)] = {(3*h / 8) * tot}")
    error = (h**4) * (b-a) * find_max_grad_f(f,4,a,b) / 80
    print(f"E = ((h/2)^4/80) * (b-a) * max(f''''(x)) = {error}")
    print_derivatives(3+1)
    print()
    #return tot*h/3

def midpoint(f, a, b, N):
    print("Midpoint Method")
    h = (b - a) / N
    print(f"a = {a}, b = {b}, N = {N}")
    print(f"h = (b-a)/N = {h}")
    tot = 0
    for i in range(0, N):
        tot += f(a+i*h + h/2)
        print(f"f({a+i*h + h/2}) = {f(a+i*h + h/2)}")
    print(f"I = h*sum[f(xi+h/2)] = {h*tot}")
    error = ((h**2)/24) * (b-a) * find_max_grad_f(f,2,a,b)
    print(f"E = (h^2/24) * (b-a) * max(f''(x)) = {error}")
    print_derivatives(2+1)
    print()
    #return tot*h

if __name__ == "__main__":
        
    # Examples for all methods
    rect_left(f, a=1, b=2, N=8)
    rect_right(f, a=1, b=2, N=8)
    trapezoid(f, a=1, b=2, N=8)
    simpson(f, a=1, b=2, N=8)
    simpson38(f, a=1, b=2, N=9)
    midpoint(f, a=1, b=2, N=8)
    
    #Example
    def f(x):
        return x*autograd.numpy.log(x)
    simpson(f, 1, 2, 4)