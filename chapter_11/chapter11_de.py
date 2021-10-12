# -*- coding: utf-8 -*-
"""
Author: Paschalis Giakoumoglou
Date: Fri Jun 18 00:42:40 2021
"""
import numpy as np
import math

def euler(f, x0, t0, t1, dt):
    print("============================== Euler's Method ============================== ")
    print()
    t = np.arange(t0, t1 + dt, dt)
    x = np.zeros((len(t), len(x0)), np.float64)
    x[0, :] = x0
    for n in range(len(t) - 1):
        x[n + 1, :] = x[n, :] + dt * f(t[n], x[n, :])
        print(f"x[{n+1}] = x[{n}] + dt*f(t[{n}], x[{n}]) = {x[n, :]} + {dt}*{f(t[n], x[n, :])} = {x[n, :]} + {dt}*{f(t[n], x[n, :])} = {x[n + 1, :]}")
    print()
    print('Summing up:')
    for n in range(len(t)):
        print(f"t[{n}] = {t[n]} -> x[{n}] = {x[n,:]}")
    print()
    #return t, x

def improved_euler(f, x0, t0, t1, dt): #not for systems
    print("==============================  Improved Euler's Method ============================== ")
    print()
    t = np.arange(t0, t1 + dt, dt)
    x = np.zeros((len(t), len(x0)), np.float64)
    x[0, :] = x0
    for n in range(len(t) - 1):
        k0 = dt * f(t[n], x[n])
        k1 = dt * f(t[n+1], x[n]+k0)
        x[n+1, :] = x[n, :] + 1/2*(k0 + k1)
        print(f"k0 = dt * f(t[n], x[n]) = {dt} * {f(t[n], x[n])} = {k0}")
        print(f"k1 = dt * f(t[n+1], x[n]+k0) = {dt} * {f(t[n+1], x[n]+k0)} = {k1}")
        print(f"x[{n+1}] = x[{n}] + 1/2*(k0+k1) = {x[n, :]} + 1/2*({k0}+{k1}) = {x[n, :] + 1/2*(k0 + k1)}")
        print()
    print()
    print('Summing up:')
    for n in range(len(t)):
        print(f"t[{n}] = {t[n]} -> x[{n}] = {x[n,:]}")
    print()
    #return t, x

def mid_point(f, x0, t0, t1, dt):
    print("============================== Mid Point Method ==============================")
    print()
    t = np.arange(t0, t1 + dt, dt)
    x = np.zeros((len(t), len(x0)), np.float64)
    x[0, :] = x0
    for n in range(len(t) - 1):
        k0 = dt *f(t[n], x[n, :])
        k1 = f(t[n]+1/2*dt, x[n, :]+1/2*k0)
        x[n+1, :] = x[n, :] + dt*k1
        print(f"k0 = dt *f(t[n], x[n, :]) ={dt}*{f(t[n], x[n])} = {k0}")
        print(f"k1 = f(t[n]+1/2*dt, x[n, :]+1/2*k0) = {dt}*f({t[n]+1/2*dt},{x[n]+1/2*k0}) = {dt}*{f(t[n]+1/2*dt, x[n]+1/2*k0)} = {k1}")
        print(f"x[{n + 1}] = x[{n}] + {dt}*{k1} = {x[n + 1]} ")
        print()
    print()
    print('Summing up:')
    for n in range(len(t)):
        print(f"t[{n}] = {t[n]} -> x[{n}] = {x[n,:]}")
    print()
    #return t, x

def runge_kutta(f, x0, t0, t1, dt): #not for systems
    print("============================== Runge Kutta Method ==============================")
    print()
    t = np.arange(t0, t1 + dt, dt)
    x = np.zeros((len(t), len(x0)), np.float64)
    x[0, :] = x0
    for n in range(len(t) - 1):
        k0 = dt*f(t[n], x[n, :])
        k1 = dt*f(t[n]+1/2*dt, x[n, :]+1/2*k0)
        k2 = dt*f(t[n]+1/2*dt, x[n, :]+1/2*k1)
        k3 = dt*f(t[n+1], x[n, :]+k2)
        x[n+1, :] = x[n, :] + 1/6*(k0 + 2*k1 + 2*k2 + k3)
        print(f"k0 = {dt}*f({t[n]}, {x[n]}) = {dt}*{f(t[n], x[n])} = {dt*f(t[n], x[n])}")
        print(f"k1 = {dt}*f({t[n]+1/2*dt}, {x[n]+1/2*k0}) = {dt}*{f(t[n]+1/2*dt, x[n, :]+1/2*k0)} ={k1}")
        print(f"k2 = {dt}*f({t[n]+1/2*dt}, {x[n]+1/2*k1}) = {dt}*{f(t[n]+1/2*dt, x[n, :]+1/2*k1)} ={k2}")
        print(f"k3 = {dt}*f({t[n+1]}, {x[n]+k2}) = {dt}*{f(t[n+1], x[n, :]+k2)} ={k3}")
        print(f"x[{n + 1}] = x[{n}] + 1/6*(k0 + 2*k1 + 2*k2 + k3) = {x[n, :]} + 1/6*({k0} + 2*{k1} + 2*{k2} + {k3}) = {x[n+1, :]}")
        print()
    print()
    print('Summing up:')
    for n in range(len(t)):
        print(f"t[{n}] = {t[n]} -> x[{n}] = {x[n,:]}")
    print()
    #return t, x

def mult_steps(f, x0, t0, t1, dt):
    print("============================== Multi Step Method ==============================")
    print()
    x=5

if __name__ == "__main__":
          
    # Example 1
    def f(t, x):
        return -x+t+1
    
    x0 = np.array([1])
    t0 = 0
    t1 = 1
    dt = 0.1 # = (t0-t1)/N
    
    euler(f, x0, t0, t1, dt)
    improved_euler(f, x0, t0, t1, dt)
    mid_point(f, x0, t0, t1, dt)
    runge_kutta(f, x0, t0, t1, dt)
    
    # Example 2: System
    def F(t, x):
        return np.array([1.1 * x[0] - 0.4 * x[0] * x[1], 0.4 * x[0] * x[1] - 0.1 * x[1]])
        
    x0 = np.array([1,2])
    t0 = 0
    t1 = 1
    dt = 0.1 # = (t0-t1)/N
    
    euler(F, x0, t0, t1, dt)
    improved_euler(F, x0, t0, t1, dt)
    mid_point(F, x0, t0, t1, dt)
    runge_kutta(F, x0, t0, t1, dt)
    
    #Example 2018
    def G(t, x):
        return np.array([-3*x[0]+2*x[1], 3*x[0]-4*x[1]])
    
    x0 = np.array([0, 0.5])
    t0 = 0
    t1 = 0.4
    dt = 0.2
    runge_kutta(G, x0, t0, t1, dt)
     
    #Example 2019
    def f(t, x):
        return t**2-math.exp(x)*math.sin(t)
    
    x0 = np.array([1])
    t0 = 0
    t1 = 0.5
    dt = 0.25
    runge_kutta(f, x0, t0, t1, dt)
    
    #Example 2019
    def f(t, x):
        return t**3 - 4*x
    x0 = np.array([1])
    t0  = 0
    t1 = 0.4
    dt = 0.2
    improved_euler(f, x0, t0, t1, dt)
    mid_point(f, x0, t0, t1, dt)