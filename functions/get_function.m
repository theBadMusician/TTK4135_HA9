function [fnc_name, f, grad_f, hess_f] = get_function(function_name)

switch function_name
case 'custom'
% Custom
fnc_name = "custom";
f = @(x) (x(1)^2 + 4*x(2)^2 - 4*x(1) - 8*x(2) + 13);
grad_f = @(x) [2*x(1) - 4; 8*x(2) - 8];
hess_f = [2, 0; 0, 8];

case 'rosenbrock'
% Rosenbrock function
fnc_name = "rosenbrock";
f = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
grad_f = @(x) [-400*x(2)*x(1)+400*x(1)^3+2*x(1)-2; 200*x(2)-200*x(1)^2];
hess_f = @(x) [-400*x(2)+1200*x(1)^2+2, -400*x(1); -400*x(2), 200];

case 'modified-rosenbrock'
% Modified Rosenbrock function
fnc_name = "modified-rosenbrock";
f =      @(x) 100*(x(2) - x(1))^2 + (1 - x(1))^2;
grad_f = @(x) [-202*x(1)-200*x(2)-2; 200*(x(2)-x(1))];
hess_f = @(x) [202,-200;-200,200];

case 'quadratic'
fnc_name = "quadratic";
f = @(x) x(1)^2 + 2*x(2)^2;
grad_f = -1;
hess_f = -1;

case 'mumbo'
fnc_name = 'mumbo';
f = @(x) x(1).^2 .* x(2).^3;
grad_f = -1;
hess_f = -1;

case 'jumbo'
fnc_name = "jumbo";
f = @(x) (x(1)^2 + 4*x(2)^2 - 4*x(1) - 8*x(2) + 13);
grad_f = @(x) [2*x(1) - 4; 8*x(2) - 8];
hess_f = [2, 0; 0, 8];
end

