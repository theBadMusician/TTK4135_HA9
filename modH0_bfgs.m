% BFGS Quasi-Newton Minimization w/ modified H0 (6.18, 6.20 Nocedal & Wright)
function [fvals, x_all, alphas] = modH0_bfgs(f, grad_f, x0, H0, beta, epsilon, rho, c)
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
i = 0;
max_iter = 5e6;
fvals = [];
x_all = [];
alphas = [];
x = x0;
obj_val = norm(f(x(1), x(2)));

H_k = beta*H0;

while norm(grad_f(x(1), x(2))) > epsilon
    % Compute the descent direction
    del_f_x = grad_f(x(1), x(2));
    p_k = -H_k*del_f_x;

    % Compute the step size that minimizes the objective function
    % alpha = 0.001; %constant
    alpha = backtracking_line_search(obj_val, x, p_k, f, grad_f, rho, c);

    % Update x and store the objective function value
    x_new = x + alpha*p_k;
    obj_val = norm(f(x(1), x(2)));
    
    % Secant
    s_k = x_new - x;
    y_k = grad_f(x_new(1), x_new(2)) - del_f_x;
    
    % Modify H0 (6.20 Nocedal & Wright)
    if i == 0
        H_k = ((y_k'*s_k)/(y_k'*y_k))*eye(2);
    end
    % Hessian approximate
    rho_k = (y_k'*s_k)^(-1);
    H_k = (eye(2)-rho_k*s_k*y_k')*H_k*(eye(2)-rho_k*s_k*y_k')+rho_k*s_k*s_k';

    fvals = [fvals, f(x(1), x(2))];
    x_all = [x_all, x];
    alphas = [alphas, alpha];
    
    x = x_new;
    i = i+1;
end
% if i >= max_iter
%     error("max iter reached");
% end