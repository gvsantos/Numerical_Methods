# Simpson's Method 

This algorithm is meant to employ the Composite Simpson's 1/3 Method in order to integrate given tabulated data. 

### Inputs:

* x - column vector containing the x-values 
* y - column vector containing the function values at the correspoding x-values

### Outputs:

* I - integral value 

This algorithm includes error checks for: if there are the appropriate number of input values, if the two vectors x and y are the same length, and if the x vector is evenly spaced.

This algorithm also includes a warning that the Trapezoidal Rule will be employed over the last interval if there are an odd number of intervals.
