# -*- coding: utf-8 -*-
"""
Author: Paschalis Giakoumoglou
Date: Thu Jun 17 21:15:07 2021
"""
import numpy as np
import pandas as pd
import sympy as symb

def least_squares(f, x, degree):
    """ 5.3 Least Squares (p.100) """
    a = pd.Series(data=[[i for i in range(len(x))],x,f], index=['i','x','f(x)'])
    print(a)
    print()
    
    n = len(x)
    
    y = np.transpose(f)
    A = np.zeros((n,degree+1))
    A[:,0] = 1
    for i in range(1, degree+1):
        A[:, i] = np.transpose(x)**i
    A[:,1] = np.transpose(x)
    
    print(A)
    
    AT = np.transpose(A)
    ATxA = np.matmul(AT, A)
    INV = np.linalg.inv(ATxA)
    a = np.matmul(np.matmul(INV, AT), y)
    print("A transpose * A = ")
    print(ATxA)
    print()
    print("(A transpose * A) ** -1 = ")
    print(INV)
    print()
    print("solution a = ")
    print(a)
    print()
    X = symb.Symbol('x')
    fun = a[0]
    for i in range(1, degree+1):
        fun += (X**i)*a[i]
    print(fun)

if __name__ == "__main__":
    
    # Example Least Squares First Grade
    x = np.array([0,3,6])
    f = np.array([1,4,5])
    least_squares(f,x,1)
    
    #Example Least Squares Second Grade
    x = np.array([0,1,2,3])
    f = np.array([3,2,4,4])
    least_squares(f,x,2)
    
    #Example 2020
    x = np.array([-0.5,0.3,0.7,1.5])
    f = np.array([1.2,2,1,-1])
    least_squares(f,x,2)