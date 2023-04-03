% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 3 - Gradient Calculation

%  Symbolic variables x_1 and x_2
close all
clear
syms x_1 x_2

% Modified Rosenbrock function
functionname = "modified-rosenbrock-";
f = @(x_1, x_2) 100*(x_2 - x_1^2) + (1 - x_1)^2;
grad_f = @(x_1, x_2) [-2*(1-x_1)-200*x_1; 100];

% fsurf(f)



function grad_f = forward_difference_gradient_approximator(f, epsilon, n_points)

for 

end