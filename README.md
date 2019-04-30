# Numerical Methods Algorithm Repository

## Summary

This repository contains original algorithms made using MATLAB as assigned in Mechanical Engineering 105 at Colorado State University. The alorithms included in this repository are to reflect my mastery of Numerical Methods as it applies to computer processing. Within each folder, you will find the prompt given and my commented code.

## Table of Contents 

**Simpsons Composite 1/3 Method**
This MATLAB function was created to implement the Simpson's 1/3 Rule to integrate tabulated experimental data. When given an input of two, one-dimensional vectors (x and y), this function evaluates the integral using the Composite 1/3 formula. There is an additional error check included that implements the Trapezoidal Rule for the last interval if there is a odd number of intervals in the given vectors. 

**LU Factorization**
This MATLAB function determines the LU Factorization of a square matrix of coefficients for a system of equations. The user is meant to input the coefficient matrix and this function will output both the Upper and Lower Triangular Matrices. In addition to this, the function will also output the pivot matrix that corresponds to the movement of rows when performing LU Factorization. 

**False Position**
This MATLAB function can be used to estimate the root of a given function using the False Position Method. The three minimum inputs include the function and two guesses at the root - you may also input the relative error and maximum number of iterations. The result will be the root estimate guess, its value when evaluated in the given function, the approximate relative error and how many iterations it took to arrive at that guess. 
