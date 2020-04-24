%{
Name: Naomi George
Date: 04/11/2020
Class: CECS 271
Instructor: Minhthong Nguyen
Purpose: To calculate and graph Newton's Divided Difference and Lagrange
Interpolation and compare results with original function.
Last updated: 04/11/2020
%}
clc
clear all

xori = -2 : 0.01 : 2; % x values from [-2,2] with a stepsize of .01
yori = 1./(xori.^2+1); % f(x) function to graph 
figure(1); % figure 1 graphs newton's divided difference and lagrange using 5 points
plot(xori, yori, 'blue'); % graph function f(x)
hold on;

x = -2 : 1 : 2; % 5 evenly spaced points on f(x)
y = 1./(x.^2+1); % y value of the 5 points
plot ( x, y, 'redo') % plot choosen points on figure 1
xi = xori;
[a]= newtonInter(x, y); % evaluate newton's divided difference coeffients 
val = newtonInterEval(x, y, xi); % evaluate the value of the function at xi using newton's divided difference
Lj = lagrangeInter(1, x,  xi); % evaluate lagrange coeffients
val = lagrangeInterEval(x, y, xi); % evaluate the value of the function at xi using lagrange interpolation
hold off;

figure(2); % figure 1 graphs newton's divided difference and lagrange using 10 points
plot(xori, yori, 'blue'); % graph function f(x)
hold on;

x = -2 : (4/9) : 2; % 10 evenly spaced points on f(x)
y = 1./(x.^2+1); % y value of the 5 points
plot ( x, y, 'redo') % plot choosen points on figure 2
[a]= newtonInter(x, y); % evaluate newton's divided difference coeffients 
val = newtonInterEval(x, y, xi); % evaluate the value of a function at xi using newton's divided difference
Lj = lagrangeInter(1, x,  xi); % evaluate lagrange coeffients
val = lagrangeInterEval(x, y, xi); % evaluate the value of a function at xi using lagrange interpolation
hold off;
