%{
Name: Naomi George
Date: 03/12/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: Use the forward difference, backward difference, and central
difference to approximate the derivative of a function at a given point 
and compare to the true value
Last updated: 03/16/2020
%}
clc
clear all

x = sym('x','real'); % Declaring 'x' as a variable
xv= (pi/8); % Value of x at which f '(x) is desired, xv
h=0.2; % Starting step size, h
n=6; % Number of times starting step size is divided by 10
Soln=diff(f(x)); % Soution using the first derivative
Ev=subs(Soln,x,xv); % The exact solution of the first derivative

bestApprox (1) = Forward(xv, h, n); % Output best approx using the Forward Difference
bestApprox (2) = Backward(xv, h, n);% Outputs best approx using the Backward Difference
bestApprox (3) = Central(xv, h, n);% Outputs best approx using the Central Difference

for k = 1:  3 % Calculate the relative True Error of each approximation
     relTrueError (k) = abs((Ev-bestApprox(k))/Ev);
end

disp('--------------------------------------------------------------------------');
disp('      Method     Best Approx   relTrueError')
disp ([["Forward";"Backward";"Central"]    double(bestApprox')    double(relTrueError') ])

% Function used for approximation
function k = f(x) 
    k= ((x*cos(x)) - (sin(x)/x));
end

% Function: Forward_Av
% Inputs: 
%     xv: Value of x at which f '(x) is desired
%     h: Starting step size
%     n: Number of step sizes
%     Output: Best approximation
function Forward_Av = Forward(xv, h, n)
    for i=1:n % loop 6 times
        N(i)=(10)^(i-1); % multiply inital step size by 10^-x
        stepSize(i)=h/(N(i)); % current step size
        Av(i)=(f(xv+stepSize(i))-f(xv))/(stepSize(i)); % Approximate value
        if i == 6
            Forward_Av = Av(i); % Best approximate value
        end
        if i>1
            Ea(i)=Av(i)-Av(i-1); % Approximate Error
        end
    end
    disp('--------------------------------------------------------------------------');
    disp('Forward Difference')
    disp('   Step Size    Approx Value     Ea')
    fprintf('%11.6f\t %10.5f\t %15.5f\n',[stepSize; Av; Ea ]); % Display stepsize, approx val, and approx error
end

% Function: Backward_Av
% Inputs: 
%     xv: Value of x at which f '(x) is desired
%     h: Starting step size
%     n: Number of step sizes
%     Output: Best approximation
function Backward_Av = Backward(xv, h, n)
    for i=1:n % loop 6 times
        N(i)=(10)^(i-1); % multiply inital step size by 10^-x
        stepSize(i)=h/(N(i)); % current step size
        Av(i)=(f(xv)-f(xv-stepSize(i)))/(stepSize(i)); % Approximate value
            if i == 6
            Backward_Av = Av(i); % Best approximate value
        end
        if i>1
            Ea(i)=Av(i)-Av(i-1); % Approximate Error
             end
    end
    disp('--------------------------------------------------------------------------');
    disp('Backward Difference')
    disp('   Step Size    Approx Value     Ea')
    fprintf('%11.6f\t %10.5f\t %15.5f\n',[stepSize; Av; Ea ]); % Display stepsize, approx val, and approx error
end

% Function: Backward_Av
% Inputs: 
%     xv: Value of x at which f '(x) is desired
%     h: Starting step size
%     n: Number of step sizes
%     Output: Best approximation
function Central_Av = Central(xv, h, n)
    for i=1:n % loop 6 times
        N(i)=(10)^(i-1); % multiply inital step size by 10^-x
        stepSize(i)=h/(N(i)); % current step size
        Av(i)=(f(xv+stepSize(i))-f(xv-stepSize(i)))/(2*stepSize(i)); % Approximate value
        if i == 6
            Central_Av = Av(i); % Best approximate value
        end
        if i>1
            Ea(i)=Av(i)-Av(i-1); % Approximate Error
        end
    end
    disp('--------------------------------------------------------------------------');
    disp('Central Difference')
    disp('   Step Size    Approx Value     Ea')
    fprintf('%11.6f\t %10.5f\t %15.5f\n',[stepSize; Av; Ea ]); % Display stepsize, approx val, and approx error
end
