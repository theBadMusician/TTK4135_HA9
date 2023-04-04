% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 3 - Gradient Calculation

%  Symbolic variables x_1 and x_2
close all
format shortG

[fnc_name, f, grad_f, hess_f] = get_function("modified-rosenbrock");
fsurf(change_func_handle(f))


x0 = [0;0];
u = 1.1e-16; epsilon_u = sqrt(u);
epsilon = 1;
N = 20;

grad_fx0 = forward_difference_point_gradient(f, x0, epsilon_u);

[grad_f_approx, perturbation_points, Z]= forward_difference_gradient(f, x0, N, epsilon, 1);

figure();
plot(grad_f_approx(1,:)); hold on
plot(grad_f_approx(2,:));
xlabel('Iteration');
ylabel('x1, x2');
title('Obj fun x values')