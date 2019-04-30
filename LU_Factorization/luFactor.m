function [L,U,P] = luFactor(A)
% LU Factorization with Partial Pivoting Algorithm 
%   Determines the LU Facorization of a given square matrix.
% Created by: Grace Santos 
% Created on: March 29 2019
% 
% Inputs: 
% A - coefficient matrix 
%
% Outputs: 
% L - lower triangular matrix 
% U - upper triangular matrix 
% P - the pivot matrix 

%error check for square matrix
[M,N] = size(A);
if M ~= N
    error('Please input sqaure matrix with equivalent numbers of rows and columns.'); 
end

%error check for more than one input value
if nargin > 1
    error('Please enter only one square matrix input to decompose.');
end 

P = eye(length(A));     %initializes P matrix as identity matrix
L = eye(length(A));     %initializes L matrix as identity matrix
A_original = A          %stores original matrix A 

for pivot_pt = 1:length(A)-1
    initial_row1 = A(pivot_pt,:);       %stores initial row of A to be pivoted 
    initial_pivot = P(pivot_pt,:);      %stores initial row of P to be pivoted
    change_L=0;                         %if pivoting does not occur
    if abs(A(pivot_pt,pivot_pt)) < max(abs(A(pivot_pt+1:length(A),pivot_pt)))   %checks if pivoting is necessary
        [Y,I] = max(abs(A(pivot_pt:length(A),pivot_pt)));       %finds index for which row needs to pivot with row 1
        I = I + (pivot_pt - 1);
        A(pivot_pt,:) = A(I,:);                 %pivots A 
        A(I,:) = initial_row1;
        P(pivot_pt,:) = P(I,:);                 %pivots P
        P(I,:) = initial_pivot;
        change_L = 1;                           %signals pivoting did occur
    end
    
    for n = pivot_pt+1:length(A)
        initial_row = A(n,:);                   %initializes row to be used in order to calulate new row values
        factor = A(n,pivot_pt)/A(pivot_pt,pivot_pt);       %finds factor to multiply row by 
        newrow = factor*A(pivot_pt,:);          %Gauss Elimination
        L(n,pivot_pt) = factor;                 %creates initial L matrix 
        A(n,:) = initial_row - newrow;          %inserts new row of A 
    end
    
    if pivot_pt > 1     %leaves the top row of L alone
        if change_L == 1        %checks if pivoting occurred
            initial_L = L(I,1:pivot_pt-1);      %saves initial value for row to be pivoted 
            L(I,1:pivot_pt-1) = L(pivot_pt,1:pivot_pt-1);       %pivots rows of L 
            L(pivot_pt,1:pivot_pt-1) = initial_L;
        end
    end
end

U = A;      %resultant A matrix is the upper triangular matrix U

end

