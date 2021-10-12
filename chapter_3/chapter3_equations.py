# -*- coding: utf-8 -*-
"""
Author: Paschalis Giakoumoglou
Date: Thu Jun 17 17:25:00 2021
"""

import matplotlib.pyplot as plt
import numpy as np
import math

#add f(a)*f(b) < 0 as a condition
def partition(f, a, b, error):
    """ 3.2 Partition (p. 32) """
    if f(a)*f(b) < 0:
        print(f"f({a}) = {f(a)}, f({b}) = {f(b)} => f({a})*f({b}) < 0")
        print()
        k = 1
        while abs(b-a) >= error:
            m = (a+b)/2
            print("k = " , k)
            print(f"[a{k},b{k}] = [{a}, {b}]")
            print(f"m{k} = (a+b)/2 = ", m)
            print(f"f(m{k}) = f({m}) =", f(m))
            print(f"f(a{k}) = f({a}) =", f(a))
            print(f"f(b{k}) = f({b}) =", f(b))
            if f(a)*f(m) <= 0:
                print(f"f(a{k})*f(m{k}) < 0")
                b = m
            else:
                print(f"f(m{k})*f(b{k}) < 0")
                a = m
            k += 1
            print(f"a{k} = ", a)
            print(f"b{k} = ", b)
            print()
    else:
        print("wrong input...")
        
def convPart(a, b, error):
    h = b-a
    n = math.log10(h/error)/math.log10((2))
    print("|r-c_n| = (1/2)^n*(b-a)")
    print(f"|r-c_n| <= 10^{math.log10(error)}")
    print(f"|r-c_n| = (1/2)^n*{h} =  10^{math.log10(error)}")
    print(f"2^n = {h}/{error} => n*log2 = log({h}/10^{math.log10(error)}) = {math.log10(h/error)}")
    print(f"n = {n} => n = {math.ceil(n)}")

def string(f, a, b, error):
    """ 3.3 String (p. 36) """
    if f(a)*f(b) < 0:
        print(f"f({a}) = {f(a)}, f({b}) = {f(b)} => f({a})*f({b}) < 0")
        print()
        k = 1
        c = 1
        while abs(f(c)) >= error:
            c = (a*f(b)-b*f(a)) / (f(b)-f(a))
            print("k = " , k)
            print(f"[a{k},b{k}] = [{a}, {b}]")
            print(f"c{k} = (a{k}*f(b{k})-b*f(a{k})) / (f(b{k})-f(a{k})) = " , c)
            print(f"f(c{k}) = ", f(c))
            print(f"f(a{k}) = ", f(a))
            print(f"f(b{k}) = ", f(b))
            if f(a)*f(c) <= 0:
                print(f"f(a{k})*f(c{k}) < 0")
                b = c
            else:
                print(f"f(c{k})*f(b{k}) < 0")
                a = c
            k += 1
            print(f"a{k} = ", a)
            print(f"b{k} = ", b)
            print()
    else:
        print("wrong input...")

def variable_string(f, a, b, error):
    """ 3.4 Partition (p. 39) """
    if f(a)*f(b) < 0:
        print(f"f({a}) = {f(a)}, f({b}) = {f(b)} => f({a})*f({b}) < 0")
        print()
        k = 0
        L = f(a)
        R = f(b)
        x = []
        x.append(a)
        print("R = f(b1) =", R)
        print("L = f(a1) =", L)
        print(f"x{k+1} = a1 ={x[k]}")
        print()
        while abs(b-a) >= error:
            x.append((a*R-b*L)/(R-L))
            print("k = " , k+1)
            print(f"[a{k+1},b{k+1}] = [{a}, {b}]")
            print(f"x{k+2} = (a{k+1}*R-b{k+1})*L/(R-L) ={x[k+1]}")
            print(f"f(x{k+2}) = ", f(x[k+1]))
            print(f"f(a{k+1}) = ", f(a))
            print(f"f(b{k+1}) = ", f(b))
            
            if f(a)*f(x[k+1]) <= 0:
                print(f"f(a{k+1})*f(x{k+2}) < 0")
                b = x[k+1]
                R = f(x[k+1])
                print("New R = ", R)
                if f(x[k])*f(x[k+1]) > 0:
                    print(f"f(x{k+1})*f(x{k+2}) > 0")
                    L = L/2
                    print("New L = L/2 =", L)
            else:
                print(f"f(x{k+2})*f(b{k+1}) < 0")
                a = x[k+1]
                L = f(x[k+1])
                print("New L = ", L)
                if f(x[k])*f(x[k+1]) > 0:
                    print(f"f(x{k+1})*f(x{k+2}) < 0")
                    R = R/2
                    print("New R = R/2 = ", R)
            k += 1
            print(f"a{k+1} = ", a)
            print(f"b{k+1} = ", b)
            print()
    else:
        print("wrong input...")

def newton(f, f2, error, x0):
    """ 3.5 Newton (p. 41) """
    x = [x0]
    k = 0
    while True:
        k+=1
        x.append(x[k-1]-f(x[k-1])/f2(x[k-1]))
        print("k = ", k)
        print(f"f(x{k-1}) = f({x[k-1]}) = {f(x[k-1])}")
        print(f"f'(x{k-1})= f'({x[k-1]}) = {f2(x[k-1])}")
        print(f"x{k} = x{k-1} - f(x{k-1})/f'(x{k-1}) = {x[k]}")
        #print(f"x{k} = {x[k]}")
        #print(f"f({x[k]}) = {f(x[k])}")        
        
        print()
        if abs(x[k]-x[k-1]) < 10**-10:
            break

def fixed_point(g, x0, error):
    """ 3.6 Fixed Point (p. 44) """
    k = 0
    x = [x0]
    print("k = ", k)
    print("x[0] = ", x[k])
    print(f"g[{x[k]}] = {g(x[k])}")
    print()
    while abs(x[k]-g(x[k])) > error:
        k+=1
        x.append(g(x[k-1]))
        print(k)
        print(f"x[{k}] = {x[k]}")
        print(f"g[{x[k]}] = {g(x[k])}")
        print()
        
if __name__ == "__main__":
    
    def f1(x):
        return x**3+x-1
    
    def g(x):
        return x**6-x-1
    
    def g2(x):
        return 6*x**5-1
    
    def h(x):
        return math.sqrt(x+2)
    
    partition(f1, a=0, b=1, error=10**-3) # Example 3.2 (p.33)
    convPart(a=0, b=1, error = 10**-5)
    string(f1, a=0, b=1, error=10**-3) 
    variable_string(f1, a=0, b=1, error=10**-3)
    fixed_point(h, x0=0, error=10**-2)
    newton(g, g2, error=10**-10, x0=2)
    print(g(1.1347))
    
    #example 2020
    def f(x):
        return x**5+x-1
    partition(f,0.5,1,1/8)
    
    # Example 2021
    def f(x):
        return (20-x+math.sqrt(20-x))*(x+math.sqrt(x)) - 155.5
    def f2(x):
        a1 = (1/(2*math.sqrt(x))+1) * (-x+math.sqrt(20-x)+20)
        a2 = (-1/(2*math.sqrt(20-x))-1) * (x+math.sqrt(x))
        return a1 + a2
    newton(f,f2,0.01,5.265)