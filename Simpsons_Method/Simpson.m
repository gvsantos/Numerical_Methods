function [I] = Simpson(x,y)
%Simpson's 1/3 Function
%   Integrates experimental tabulated data numerically by employing both
%the Simpson's 1/3 and Trapeziodal Rules.
%
%Created by: Grace Santos 
%Created on: April 15, 2019 

if nargin ~= 2          %error check for correct number of inputs
    error('Please enter the correct number of inputs.');
end

if length(x) ~= length(y)       %error check that the input vectors are the same length
    error ('Please make sure that x and f(x) vectors are the same length.');
end

a = min(x);     %sets min value to be evaluated at  
b = max(x);     %sets max value to be evaluated at
n = length(x);  %sets number of inputs 
z = n-1;        %sets number of intervals
fx_odd = 0;     %initializes calculation of function value at odd input values 
fx_even = 0;    %initializes calculation of function value at even input values

if x ~= linspace(a,b,n)     %error check that vector is evenly spaced
    error('Your x vector is not equally spaced and cannot be computed.');
end

if mod(n,2) == 0        %determines if there are an odd number of intervals using length of vector
    warning('There is an odd number of intervals. The Trapezoidal Rule will be implemented for the last interval.');
    for k = 2:2:z-1     %sums all function values at odd input values
        fx1 = y(k);     
        fx_odd = fx_odd + fx1;
    end 
    for k = 3:2:z-1     %sums all function values at even input values
        fx2 = y(k);       
        fx_even = fx_even + fx2;
    end
    I = ((b-a)*(((y(1)+(4*fx_odd)+(2*fx_even)+y(n))/(3*z))) + ((b-a)*((y(n)-y(z))/2)));  %includes Trap Rule for last interval
else 
    for k = 2:2:n-1     %sums all function values at odd input values
        fx1 = y(k);      
        fx_odd = fx_odd + fx1;
    end 
    for k = 3:2:n-1     %sums all function values at even input values
        fx2 = y(k);
        fx_even = fx_even + fx2;
    end
    I = (b-a)*(((y(1)+(4*fx_odd)+(2*fx_even)+y(n))/(3*z)))      %Composite Simpson's 1/3 Rule
end

end

