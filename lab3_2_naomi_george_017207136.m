%{
Name: Naomi George
Date: 03/12/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Apply the Bisection, Newton-Raphson, and Secant Methods to 
find root of the given function cos(X)-3*X and compare to the true value
Last updated: 03/16/2020
%}
clear all
clc

x0 = 2; % inital guess for newton-raphson method
x1 = 1; % inital guess for newton-raphson method and secant method

a = 0.000; % lower bound for bisection method
b = 10.000; % upper bound for bisection method
tol = 0.001; % tolerance of the relative approx error
f=@(X)(cos(X)-3*X); % Function to find root
df=@(X)(-sin(X)-3); % derivative of function
maxIter = 20; % maximum number of iterations allowed

[bisec_root, err, x_mid] = bisec(f, a, b, tol, maxIter);
[newraph_root, fx, x]=  newraph(f, df, x0, tol, maxIter);
[secant_root, fx_next, x_next] = secant(f, x0, x1, tol, maxIter); 

true_root = fzero(f,0); % find zero of function f using an inbuilt function 
true_error(1) = ((true_root - bisec_root)/ true_root); % relative true error of bisection method = (true value - approx value) / true val
true_error(2) = ((true_root - newraph_root)/ true_root); % relative true error of newton-raphson method
true_error(3) = ((true_root - secant_root)/ true_root); % relative true error of secant method
disp('--------------------------------------------------------------------------');
disp(['True Root = ', num2str(true_root)]);
disp('    Method              RelTrueError');
disp ([["Bisection";"Newton-Raphson";"Secant"]    true_error' ]);


% Function bisec
% Inputs: 
%     f: Function to find root
%     a: Lower bound
%     b: Upper bound
%     tol: Tolerance
%     maxIter: Maximum iterations allowed
% Outputs:
%     root: Root of function f
%     error: Vector of relative approximating error
%     x_mid: Vector of approximating value of the root

function [root, error, x_mid] = bisec(f, a, b, tol, maxIter)
root = 0; % initalize in case of failure
error(1) = 0; % initalize in case of failure
x_mid(1) = 0; % initalize in case of failure
x_lower(1) = a; % initalize lower bound
x_upper(1) = b; % initalize upper bound
if ((f(a)*f(b))>=0) % check if root exists between the guesses
    disp('f(a)f(b)<0 not satisfied!');
    return % ceases execution
end
x_mid(1) = ((x_lower(1)+x_upper(1))/2); % midpoint 
iter(1) = 1;
for i=2:maxIter
    iter(i) = i; % number of iterations
    if (f(x_lower(i-1))*f(x_mid(i-1)) < 0) % root is between x_lower and x_mid
        x_lower(i) = x_lower(i-1); % change upper and lower bounds
        x_upper(i) = x_mid(i-1);
        x_mid(i)= ((x_lower(i)+x_upper(i))/2); % find next midpoint
    elseif (f(x_lower(i-1))*f(x_mid(i-1)) > 0) % root is between x_mid and x_upper
        x_lower(i) = x_mid(i-1); % change upper and lower bounds
        x_upper(i) = x_upper(i-1);
        x_mid(i)= ((x_lower(i)+x_upper(i))/2); % find next midpoint
    elseif (f(x_lower(i-1))*f(x_mid(i-1)) == 0) % root is at the midpoint
        x_mid(i) = x_mid(i-1);
    end
    
    error(i) = abs((x_mid(i)-x_mid(i-1))/x_mid(i)); % vector of relative approx errors

    if (error(i) < tol) % stop iterations if error is less than tolerance
        root = x_mid(i); % root is at the midpoint
        disp('--------------------------------------------------------------------------');
        disp('Bisection Method ')
        disp(['Root = ', num2str(root)]);
        disp('  Iteration    x_lower    x_upper     x_mid      relApproxError');
        fprintf('%5d\t %13.5f\t %8.5f\t %8.5f\t %5.5f\n',[iter;  x_lower; x_upper; x_mid; error]);
        break;
    elseif (i == maxIter) % stop if iterations exceed maximum number of iterations allowed
        disp('--------------------------------------------------------------------------');
        disp('Bisection Method ')
        disp('  Iteration    x_lower    x_upper     x_mid      relApproxError');
        fprintf('%5d\t %13.5f\t %8.5f\t %8.5f\t %5.5f\n',[iter;  x_lower; x_upper; x_mid; error]);
        disp('We have NOT converged. We have reached the maximum number of steps allowed.');
        break;  
    end
end
end

% Function newraph
% Inputs: 
%     f: Function to find root
%     df: Derivative of f
%     x0: Inital guess
%     tol: Tolerance
%     maxIter: Maximum iterations allowed
% Outputs:
%     root: Root of function f
%     fx: Vector of values of function at each approximating value x
%     x: Vector of approximating value of the root
function [root, fx, x] = newraph(f, df, x0, tol, maxIter)
x(1) = x0 - (double(subs(f,x0))/double(subs(df,x0))); % 1st approx value of root
fx(1) = double(subs(f,x(1))); % value at x
dfx(1) = double(subs(df,x(1))); % derivative at value x
error (1) = abs((x(1)-x0)/x(1));  % relative approx error
iter (1) = 1; % first iteration
for i=2:maxIter
    iter(i) = i;
    x(i)= x(i-1) - (fx(i-1)/dfx(i-1)); % approx value of root
    fx(i) = double(subs(f,x(i))); % value at x
    dfx(i) = double(subs(df,x(i))); % derivative at value x
    error(i)=abs(x(i)-x(i-1)); % relative approx error
    if(error(i)<tol) % stop once error is less than tolerance
        root=x(i); % approx root found
        disp('--------------------------------------------------------------------------');
        disp('Newton Raphson Method ')
        disp(['Root = ', num2str(root)])
        disp('  Iteration    x(i)      f(xi)       relApproxError')
        fprintf('%5d\t %13.5f\t %8.5f\t %5.5f\n',[iter;  x;  fx; error])
       

        break;
    elseif (i == maxIter) % stop if iterations exceed maximum number of iterations allowed
        disp('--------------------------------------------------------------------------');
        disp('Newton Raphson Method ')
        disp('  Iteration    x(i)      f(xi)       relApproxError')
        fprintf('%5d\t %13.5f\t %8.5f\t %5.5f\n',[iter;  x;  fx; error])
        disp('We have NOT converged. We have reached the maximum number of steps allowed.');
        break;
    end
    
    end
end

% Function secant
% Inputs: 
%     f: Function to find root
%     x0: Inital guess
%     x1: Inital guess
%     tol: Tolerance
%     maxIter: Maximum iterations allowed
% Outputs:
%     root: Root of function f
%     fx_next: Vector of values of function at each approximating value x
%     x_next: Vector of approximating value of the root
function [root, fx_next, x_next] = secant(f, x0, x1, tol, maxIter)
x_prev(1) = x0; % x(i-1)
fx_prev(1)=double(subs(f,x_prev(1))); % value at  x(i-1)
x_current(1) = x1; % x(i)
fx_current(1)=double(subs(f,x_current(1))); % value at  x(i)
for i=1:maxIter
        iter (i) = i;
        x_next(i)= (x_current(i) - (((fx_current(i))*(x_current(i)-x_prev(i)))/(fx_current(i)-fx_prev(i)))); % x(i+1)
        fx_next(i)=double(subs(f,x_next(i))); % value at  x(i+1)
        error(i)=abs((x_next(i)-x_current(i))/(x_next(i))); % relative approx error of x(i+1) approximation

        if(error(i)<tol) % stop once error is less than tolerance
            root = x_next(i); % Best root approximation
            disp('--------------------------------------------------------------------------');
            disp('Secant Method ')
            disp(['Root = ', num2str(root)])
            disp('  Iteration    x(i-1)     x(i)       x(i+1)      f(xi-1)     f(xi)       f(xi+1)     relApproxError')
            fprintf('%5d\t %13.5f\t %8.5f\t %5.5f\t %5.5f\t %5.5f\t %5.5f\t %5.5f\n',[iter; x_prev; x_current; x_next; fx_prev; fx_current; fx_next; error ])
            break;
        elseif (i == maxIter) % stop if iterations exceed maximum number of iterations allowed
            disp('Secant Method ')
            disp('----------------------')
            disp('  Iteration    x(i-1)     x(i)       x(i+1)      f(xi-1)     f(xi)       f(xi+1)     relApproxError')
            fprintf('%5d\t %13.5f\t %8.5f\t %5.5f\t %5.5f\t %5.5f\t %5.5f\t %5.5f\n',[iter; x_prev; x_current; x_next; fx_prev; fx_current; fx_next; error ])
            disp('We have NOT converged. We have reached the maximum number of steps allowed.');
            break;
        end
        
        % update values for next iteration
        x_prev(i+1) = x_current(i); 
        x_current(i+1) = x_next(i);
        fx_prev(i+1) = fx_current(i);
        fx_current(i+1) = fx_next(i);
end 
end
