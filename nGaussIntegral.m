% Function Name: simpsonIntergal
% Inputs:
%  f: Function to be integrated 
%  a: Lower bound 
%  b: Upper bound
%  N: Number of intervals (2?N?5)
% Output:
%  val: approximate value of integral 
function val = nGaussIntegral(f, a, b, N)
% Setup Gaussian Coefficients and Evaluation Points for 2?N?5
    xVal(2,1) = -0.5773502691896260; 
    xVal(2,2) = 0.5773502691896260;
    cWeight(2,1) = 1.0;
    cWeight(2,2) = 1.0;

    xVal(3,1) = -0.7745966692414830;
    xVal(3,2) = 0.0;
    xVal(3,3) = 0.7745966692414830;
    cWeight(3,1) = 0.5555555555555560;
    cWeight(3,2) = 0.8888888888888890;
    cWeight(3,3) = 0.5555555555555560;

    xVal(4,1) = -0.8611363115940530;
    xVal(4,2) = -0.3399810435848560;
    xVal(4,3) = 0.3399810435848560;
    xVal(4,4) = 0.8611363115940530;
    cWeight(4,1) = 0.3478548451374540;
    cWeight(4,2) = 0.6521451548625460;
    cWeight(4,3) = 0.6521451548625460;
    cWeight(4,4) = 0.3478548451374540;

    xVal(5,1) = -0.9061798459386640;
    xVal(5,2) = -0.5384693101056830;
    xVal(5,3) = 0.0;
    xVal(5,4) = 0.5384693101056830;
    xVal(5,5) = 0.9061798459386640;
    cWeight(5,1) = 0.2369368850561890;
    cWeight(5,2) = 0.4786386704993660;
    cWeight(5,3) = 0.5688888888888890;
    cWeight(5,4) = 0.4786386704993660;
    cWeight(5,5) = 0.2369368850561890;

    val = 0 ;
    for i=1:N
      val = val + cWeight(N,i)*f((b-a)/2*xVal(N,i)+(a+b)/2 ) ; % Approximation via Gaussian integration from a to b
    end
    val = (b-a)/2 * val ; % Scale the result account for the interval spacing
end