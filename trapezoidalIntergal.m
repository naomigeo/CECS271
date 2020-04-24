% Function Name: trapezoidalIntergal
% Inputs:
%  f: Function to be integrated 
%  a: Lower bound 
%  b: Upper bound
%  N: Number of intervals
% Output:
%  val: approximate value of integral 
function val = trapezoidalIntergal(f, a, b, N)
    h=(b-a)/N; % Calculate the spacing parameter
    sum= 0;  
    for i=1:1:N-1
        sum= sum + f(a+(i*h)); % Sum all function values not including evalations at a and b

    end
    val = h/2*(f(a)+f(b)+2*sum); % Approximation for the integral
end