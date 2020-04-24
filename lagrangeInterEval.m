%{
Name: Naomi George
Date: 04/11/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Function to implement the Lagrange Interpolation
Last updated: 04/11/2020
%}
function val = lagrangeInterEval(x, y, xi)
% Inputs:
%  x: [x0, x1, x2,..., xn]
%  y: [y0, y1, y2,..., yn]
%  xi: value to be evaluated at
% Output:
%  val: value of function at xi
    len = length(x); % length of x vector
    Lj = lagrangeInter(1, x,  xi);
    fx = 0; % initialze interpolation function
    for i = 1:len 
        fx = fx + Lj(i) * y(i); % interpolation function
    end
    syms xfunc; % create symbolic variables  
    val = subs(fx,xfunc,xi); % value of function at xi 
    plot(xi, val, 'green'); % graph lagrange interpolation results
end