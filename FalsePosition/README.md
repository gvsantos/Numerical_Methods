# False Position

This algorithm is created to estimate the value of a root for a given function using the False Position Method. 

### Inputs:

* func - the function being evaluated
* xl - the lower guess at the root
* xu - the upper guess at the root
* es - the desired relative error

    If not specified by the user, it defaults to 0.0001%  

* maxiter - the number of iteration desired 

   If not specified by the user, it defaults to 200 iterations.   

### Outputs:

* root - the estimated root location value 
* fx - the function value evaluated at the root location 
* ea - the approximate percent relative error 
* iter - the number of iterations performed in order to arrive at root guess 

As pointed out by my professor, this algorithm has two errors of not stopping at the es value or at the maxiter value. 
