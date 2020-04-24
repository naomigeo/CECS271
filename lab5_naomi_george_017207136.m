clc
clear all

f=@(x)(1./((x.^2)+1)); % Function to integrate
a = -2; % Lower Bound
b = 2; % Upper Bound
intervals = [2, 3, 4, 5]; % Vector of the number of intervals to approximate with
exact = integral(f, a, b); % Find exact integration value

for i=1:(size(intervals,2)) % Use approximation rules for n = 2, 3, 4, 5
    N = intervals(i); % Current number of integrals
    val(1, i) = trapezoidalIntergal(f, a, b, N); % Integral Approx using Trapezoidal rule
    val(2, i) = simpsonIntergal(f, a, b, N); % Integral Approx using 1/3 Simpson's rule
    val(3, i) = nGaussIntegral(f, a, b, N); % Integral Approx using n-point Gauss Quadrature rule
    for j=1:3
        error(j, i) = abs((exact-val(j, i))/exact); % Calculate the relative true error
    end
end

% Display the output data 
disp('--------------------------------------------------------------------------');
disp('                      INTEGRAL APPROXIMATION TABLE');
method = {'Trapezoidal';'Simpsons';'Gauss'};
T = table(method,val,'VariableNames',{'Method','N = 2     N = 3     N = 4     N = 5'});
disp(T);
% Display exact value of integration 
disp('--------------------------------------------------------------------------');
fprintf(['\nThe exact integration value is ', num2str(exact), '\n\n']);
% Display the relative true errors
disp('--------------------------------------------------------------------------');
disp('                          RELATIVE TRUE ERROR TABLE');
T = table(method,error,'VariableNames',{'Method',' N = 2       N = 3       N = 4         N = 5'});
disp(T);
