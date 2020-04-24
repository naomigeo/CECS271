%{
Name: Naomi George
Date: 04/11/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Function to evaluate the value of a function at an xi
Last updated: 04/11/2020
%}
function val = newtonInterEval(x, y, xi)
% Inputs:
%  x: [x0, x1, x2,..., xn]
%  y: [y0, y1, y2,..., yn]
%  xi: value to be evaluated at
% Output:
%  val: value of function at xi
    [a] = newtonInter(x, y); % evaluate Newton's DD coeffients
    fx = 0; % function resulting from Newton's Divided Difference
    len = length(x); % length of x vector
    for i = 1:len
        k = 1;
        for j = i:-1:2
            syms xfunc; % creates symbolic variable  
            k = k * (xfunc - x(j-1)); % (X-X0)(X-X1)...(X-Xn-1)
        end
        fx = fx + a(i)*k; % create interpolation function
    end
    val = subs(fx,xfunc,xi); % evaluate the value of function at xi using newton's divided difference
    plot(xi, val, 'green'); % graph result of newton's divided difference
end