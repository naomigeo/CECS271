% Function Name: simpsonIntergal
% Inputs:
%  f: Function to be integrated 
%  a: Lower bound 
%  b: Upper bound
%  N: Number of intervals
% Output:
%  val: approximate value of integral 
function val = simpsonIntergal(f, a, b, N) 
    if rem(N,2)==0 % Number of intervals must be even
        h=(b-a)/N; % Calculate the spacing parameter
        sumOdd=0;
        sumEven=0;
        for i=1:1:N-1
            if rem(i,2)==1
               sumOdd=sumOdd+f(a+i*h);% Sum of odd terms
             else
               sumEven=sumEven+f(a+i*h); % Sum of even terms
            end
        end
        val=h/3*(f(a)+f(b)+4*sumOdd+2*sumEven);  % Approximation for the integral
    else % If number of intervals is odd, return 0
        val= 0;
    end
end 