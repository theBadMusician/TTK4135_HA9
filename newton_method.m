% Newton Minimization Method
function [fvals, x_all, alphas] = newton_method(f, grad_f, hess_f, x0, epsilon, rho, c)
%
% Inputs:
% - f: symbolic function to be minimized (2-dimensional only)
% - grad_f: symbolic gradient of f
% - hess_f: symbolic hessian of f
% - x0: initial point for the optimization
% - epsilon: gradient tolerance for the minimization
% 
% Output:
% - fvals: array of objective function values across the iterations
% - x_all: matrix of function points across the iterations
% - alphas: array of step length alpha values across the iterations

% Init loop
fvals = [];
x_all = [];
alphas = [];
x = x0;
obj_val = norm(f(x(1), x(2)));

while norm(grad_f(x(1), x(2))) > epsilon
    % Compute the Newton direction
    hessian_k = hess_f(x(1), x(2));
    p_k = -inv(hessian_k)*grad_f(x(1), x(2));
    % p_k = -inv(hess_f)*grad_f(x(1), x(2));

    % Compute the step size that minimizes the objective function
    % alpha = 0.001; %constant
    alpha = backtracking_line_search(obj_val, x, p_k, f, grad_f, rho, c);

    % Update x and store the objective function value
    x = x + alpha*p_k;
    obj_val = norm(f(x(1), x(2)));

    fvals = [fvals, f(x(1), x(2))];
    x_all = [x_all, x];
    alphas = [alphas, alpha];
end
end