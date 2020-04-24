%{
Name: Naomi George
Date: 04/11/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Function to calculate the lagrange coefficient Li at an xi
Last updated: 04/11/2020
%}
function Lj = lagrangeInter(j, x,  xi)
% Inputs:
%  j: value to be skipped
%  x: [x0, x1, x2,..., xn]
%  xi: value to be evaluated at
% Output:
%  Lj: vector that contains lagrange coefficient in the expansion
    len = length(x); % length of x vector
    Lj = sym('xfunc', len); %  refers to symbolic variable xfunc
    for i = 1:len
        Lj(i) = 1;
        for j = 1:len
            if (i ~= j)
                syms xfunc; % creates symbolic variable  
                Lj(i) = Lj(i) .* (xfunc - x(j))/(x(i)-x(j)); % lagrange coefficient equation
            end
        end
    end
end 
