function [root, fx, ea, iter] = falsePosition(func, x_l, x_u, es, maxiter,varargin)
%Created by: Grace Santos
%On: February 28, 2019
%
%The function above utilizes the false position method to estimate
%the roots of a given function.
%
%Inputs:
%func - the function being evaluated 
%x_l - the lower bound guess
%x_u - the upper bound guess 
%es - the desired relative error (default at 0.0001%)
%maxiter - the number of iterations desired (default to 200)
%
%Outputs;
%root - the estimated root location 
%fx - the funtion evaluated at the root location 
%ea - the approximate relative error (given in %)
%iter - the number of iterations that were performed

if nargin < 3               %checks the number of input arguments
    error('Please enter more than three or more inputs.');
end
if nargin < 4 || isempty(es)        %sets default es value if user does not input value
    es = 0.0001;
end 
if nargin < 5 || isempty(maxiter)       %sets default max interations if user does not input value
    maxiter = 200;
end

root_test = func(x_l,varargin{:})*func(x_u,varargin{:});       %equation to test if bounds contain a root

if root_test > 0    %warning to user that the bounds chosen do not contain a root
    error('Bounds given do not include a root. Please enter valid bounds.')
end 

iter = 0;   %sets inital value of iterations
ea = 100;   %sets initial value of approximate relative error
x_r = x_l;  %sets initial root guess value to be the lower bound value

while ea > es || iter < maxiter 
    x_r_previous = x_r;         %stores the value of the previous guess in order to calculate error later
    x_r = x_u - (func(x_u,varargin{:})*(x_l-x_u)/(func(x_l,varargin{:}) - func(x_u,varargin{:})));      %uses false position equation to calculate new root
    iter = iter + 1;            %increments number of iterations
    ea = abs((x_r - x_r_previous)/x_r) * 100;   %calculates approximate relative error
    if func(x_r,varargin{:})*func(x_l,varargin{:}) < 0      %test to determine if the calculated root value should replace the upper or lower bound
        x_u = x_r;      %root replaces upper bound
    else 
        x_l = x_r;      %root replaces lower bound
    end 
end 

root = x_r                  %stores final root value
fx = func(x_r,varargin{:})  %stores value of function evaluated at the root
ea = ea                     %stores approximate relative error value
iter = iter                 %stores number of iterations 
end


