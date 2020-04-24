%{
Name: Naomi George
Date: 04/11/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Function to calculate the coefficient of the nth degree polynomial
Last updated: 04/11/2020
%}
function [a] = newtonInter(x, y)
% Inputs:
%  x: [x0, x1, x2,..., xn]
%  y: [y0, y1, y2,..., yn]
% Output:
%  [a]: vector that contains coefficients of the nth degree polynomial

    len = length(x); % length of x vector
    coef(:,1)=y'; % fill first column of coe matrix 
    for j=2:len
        for i=j:len
            coef(i,j)= (coef(i-1,j-1)-coef(i,j-1)) / (x(i-j+1)-x(i)); % evaluate coeffient
        end
    end
    a = diag(coef)'; % newton's DD coeffients are at the diagonal of d matrix
end