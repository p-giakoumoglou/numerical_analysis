# -*- coding: utf-8 -*-
"""
Author: Paschalis Giakoumoglou
Date: Thu Jun 17 19:16:15 2021
"""
import numpy as np
import math
import sympy as symb
import pandas as pd


def lagrange(f, x):
    """ 4.3 Lagnrance (p.71) """
    a = pd.Series(data=[[i for i in range(len(x))],x,f], index=['i','x','f(x)'])
    print(a)
    print()
    X = symb.Symbol('x')
    l = []
    exL = []
    fun = 0
    expandedFun = 0
    for j in range(len(f)):
        l.append(1)
        exL.append(1)
        temp = 1
        for i in range(len(f)):
            if i!=j:
                l[j] *= (X-x[i])
                temp *= (x[j] - x[i])
                
        l[j] /= temp
        exL[j] = symb.expand(fun)
        print(f"l{j}(x) = {l[j]}")
        fun += f[j]*l[j]
        expandedFun += symb.expand(f[j]*l[j])
    print()
    print(f"f(x) = {fun}")
    print(f"f(x) = {expandedFun}")

def divided_diff(f, x):
    """ 4.4 Divided Differences (p.74) """
    a = pd.Series(data=[[i for i in range(len(x))],x,f], index=['i','x','f(x)'])
    print("Input:")
    print(a)
    print()
    X = symb.Symbol('x')
    n = len(x)
    
    D = np.zeros((n,n)) * np.nan # Divided Differences Array
    d = np.zeros(n) # Polynomial Coeffs
    D[:,0] = f
    
    # Calculate D
    for j in range(1,n):
        k = j
        for i in range(j, n):
            D[i,j] = (D[i, j-1] - D[i-1, j-1]) / (x[i]-x[i-k])
            print(f"D[{i},{j}] = ({D[i, j-1]} - {D[i-1, j-1]}) / ({x[i]} - {x[i-k]}) = {D[i,j]}")
     
    # Calculate d
    for i in range(n):
        d[i] = D[i, i]
        
    print()
    print("Divided Differences Array D = ")
    print(D)
    print()
    print("Coefficients of Interpolation polynomial d = diag(D) = ")
    print(d)
    print()
    p = f[0]
    for i in range(1,len(d)):
        temp = d[i]
        for j in range(i):
            temp *= (X-x[j])
        p += temp
    print(f"Interpolation Polynomial p(x) = {p} = {symb.expand(p)}")
                
def finite_diff(f, x):
    """ 4.5 Finite Differences (p.78) """
    a = pd.Series(data=[[i for i in range(len(x))],x,f], index=['i','x','f(x)'])
    print(a)
    print()
    X = symb.Symbol('x')
    h = x[1] - x[0]
    n = len(x)
    
    Delta = np.zeros((n,n)) * np.nan # Finite Differences Array
    D = np.zeros((n,n)) * np.nan # Divided Differences Array
    d = np.zeros(n) # Polynomial Coeffs
    
    # Calculate Delta
    Delta[:,0] = f
    for j in range(1,n):
        k = j
        for i in range(j, n):
            Delta[i,j] = Delta[i,j-1] - Delta[i-1,j-1]
    
    # Calculate D
    for i in range(1,n):
        for j in range(n):
            D[i,j] = Delta[i,j] / (math.factorial(i) * (h ** i))   
    
    # Calculate d
    for i in range(n):
        d[i] = D[i, i]
        
    print()
    print("Finite Differences Array Δ = ")
    print(Delta)
    print()
    print(f"Coefficients of polynomial for r = (x-x[0])/h = (x-{x[0]})/{h} is")
    print(f"{Delta[0,0]} + Σi=1:{n}( diag(Δ) * combination(r per i) )")
    print()
    print("Divided Differences Array D = ")
    print(D)
    print()
    print("Coefficients of Interpolation polynomial d = diag(D) = ")
    print(d)
    print()
    p = f[0]
    for i in range(1,len(d)):
        temp = d[i]
        for j in range(i):
            temp *= (X-x[j])
        p += temp
    print(f"Interpolation Polynomial p(x) = {p} = {symb.expand(p)}")
    
def aitken(f, x, z):
    """ 4.6 Aitken (p.82) """
    a = pd.Series(data=[[i for i in range(len(x))],x,f], index=['i','x','f(x)'])
    print(a)
    print()
    n = len(x)
    xz = x - z
    A = np.zeros((n,n))
    A[:, 0] = f
    print("Calculating A[r, k] = (xz[k-1]*A[r, k-1] - xz[r]*A[k-1, k-1]) / (x[k-1]-x[r]) where xz = x-z")
    for k in range(1, n):
        for r in range(k ,n):
            A[r, k] = (xz[k-1]*A[r, k-1] - xz[r]*A[k-1, k-1]) / (x[k-1]-x[r])
            print(f"A[{r},{k}] = ({xz[k-1]} * {A[r, k-1]} - {xz[r]} * {A[k-1, k-1]}) / ({x[k-1]} - {x[r]})")
    print()
    print("A = ")
    print(A)

if __name__ == "__main__":
    
    # Example Lagrange
    x = np.array([-1,0,1])
    f = np.array([1,1,2])
    lagrange(f, x)
    
    # Example Divided Differences
    x = np.array([0,1,2,4])
    f = np.array([1,1,2,5])
    divided_diff(f, x)
    
    # Example Finite Differences
    x = np.array([1,2,3,4,5])
    f = np.array([1,-1,1,-1,1])
    finite_diff(f, x)
    
    # Example Aitken
    x = np.array([2,4,6,8])
    f = np.array([1,-2,3,5])
    z = 5
    aitken(f, x, z)
    
    #Example 2018
    x = np.array([1,2,4,5,7])
    f = np.array([52,5,-5,-40,10])
    lagrange(f, x)
    divided_diff(f, x)
    
    #Example 2019
    x = np.array([0,1,2])
    f = np.array([0,1,9])
    divided_diff(f, x)
    aitken(f, x, 0.5)
    
    #Example 2020
    x = np.array([1,2,3,4,5,6,7,8,9,10])
    f = np.array([112, 0, 0, 0, 0 ,0 ,0 ,0 ,0, 2])
    finite_diff(f, x)
    aitken(f, x, 0)
    
    # Example 2021a
    x = np.array([-2,-1,0,1,2])
    def f(x):
        return 3 ** x
    f = np.array([f(-2),f(-1),f(0),f(1),f(2)])
    aitken(f,x,np.sqrt(3))
    
    # Example 2021b
    x = np.array([0,1,2,4,5])
    def f(x):
        return np.sqrt(x)
    f = np.array([f(0),f(1),f(2),f(4),f(5)])
    aitken(f,x,np.sqrt(3))
    
    
    

    
    