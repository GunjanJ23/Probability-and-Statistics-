%MATLAB Code:

%A.

clear all;
clc;
%Part A 
%Generating exponential distribution by Uniform
 
%Doing inverse of distribution
tic;
clear all;
clc;
mu = 1;
X_A = expinv(rand(1e5,5),mu);
S_A = sum(X_A,2);
 
%Computing mean and variance of part A
mean_parta = mean(S_A);
var_parta = var(S_A);
 
%Plotting Histogram of the pdf
numbins = 50;
h = histogram(S_A,numbins)
toc;
 
 
%Part B
tic;
xmul = ones(10000,1);
x = rand(10000,5);
for i = 1:10000
for j = 1:5
    xmul(i) = xmul(i) * x(i,j);
end
end
lambda = 1;
x_result = ones(10000,1);
for i = 1:10000
x_result(i) = -(log(xmul(i)))/ lambda;
end
 
%Computing mean and variance of part B
mean_partb = mean(x_result);
var_partb = var(x_result);
 
toc;
