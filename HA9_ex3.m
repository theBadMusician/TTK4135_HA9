% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 3 - Gradient Calculation

%  Symbolic variables x_1 and x_2
close all
format shortG

[fnc_name, f, grad_f, hess_f] = get_function("modified-rosenbrock");
% fsurf(change_func_handle(f))

% params
x0 = [0.5;0.5];
u = 1.1e-16; epsilon_u = sqrt(u);
epsilon = epsilon_u;
N = 200;

% Gradient at x0
grad_fx0_true = grad_f(x0)
grad_fx0 = forward_difference_point_gradient(f, x0, epsilon)
delta_df = grad_fx0_true - grad_fx0


% Gradient of f around x0
[df_est, perturbation_points, Z, fig] = forward_difference_gradient(f, x0, N, epsilon);

% Evaluate gradients of f element-wise with x1 and x2 using a loop
df_at_points = zeros(size(perturbation_points));
for i = 1:size(perturbation_points, 1)
    for j = 1:size(perturbation_points, 2)
        df_at_points(:,j) = grad_f([perturbation_points(:,j) perturbation_points(:,j)]');
    end
end

% Create the range of x values using meshgrid
[x1, x2] = meshgrid(perturbation_points(1, :), perturbation_points(2, :));
[dx1, dx2] = meshgrid(df_at_points(1, :), df_at_points(2, :));

% Display the result
figure;
quiver(x1,x2,dx1,dx2);
hold on
contour(x1, x2, Z);
axis equal
hold off
xlabel('x_1');
ylabel('x_2');
title('True gradient of f');
true_df_fig = gcf;

% Plot
figure();
plot(df_est(1,:)); hold on
plot(df_est(2,:)); hold on
plot(df_at_points(1,:), "o--"); hold on
plot(df_at_points(2,:), "o--");
xlabel('offset from x0');
ylabel('x1, x2');
title('gradient values')
df_est_plot = gcf;


% Save data
data.x0 = x0;
data.epsilon = epsilon;
data.N = N;
data.df_est = df_est;
data.perturbation_points = perturbation_points;

filename = fnc_name+"-x0="+x0(1)+","+x0(2)+"-epsilon="+epsilon+"-N="+N;
mkdir("ex3_data/"+filename+"/")
saveas(true_df_fig, "ex3_data/"+filename+"/"+filename+"-true-gradient"+".png")
saveas(fig, "ex3_data/"+filename+"/"+filename+"-gradient"+".png")
saveas(df_est_plot, "ex3_data/"+filename+"/"+ filename+"-gradient_values"+".png")
save("ex3_data/"+filename+"/"+ filename + ".mat", "data")