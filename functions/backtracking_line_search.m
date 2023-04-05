
% Bcktracking Line Search
function alpha = backtracking_line_search(obj_val, x_k, p_k, f, grad_f, rho, c)
% Performs backtracking line search to find a step size that satisfies the Armijo-Goldstein condition.
%
% Inputs:
% - x_k: current point (n-dimensional column vector)
% - p_k: search direction at step k (n-dimensional column vector)
% - obj_val: objective function evaluated at the current point
% - grad_f: gradient of the function evaluated at the current point (n-dimensional column vector)
% - rho: contraction factor <0, 1>
% - c: condition parameter <0, 1>
% 
% Output:
% - alpha: step size that satisfies the 1st Wolfe condition


%  init params
alpha = 1; % initial step size [0, 1]

obj_val_new = obj_val;
wolfe_cond = norm([0;0]);
while obj_val_new >= wolfe_cond  % 1st Wolfe condition
    x_k_new = x_k + alpha * p_k;
    obj_val_new = norm(f(x_k_new)); % evaluate objective function at new point
    wolfe_cond = obj_val + c * alpha * grad_f(x_k)' * p_k;
    alpha = rho * alpha;
end
end
