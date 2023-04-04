function [df, perturbation_values, Z] = forward_difference_gradient(f, x0, N, epsilon, do_plot)
% Create the range of x values using meshgrid
perturbation_values = perturbation_array(x0, N, epsilon);

% Initialize the gradient array
df = zeros(length(x0), length(perturbation_values(1,:)));
% Calculate the gradient using the forward difference algorithm for each direction
for i = 1:length(x0)
    for j = 1:length(perturbation_values(1,:))
        % Forward difference approximation
        df(:, j) = forward_difference_point_gradient(f, perturbation_values(:,j), epsilon);
    end
end


% Create the range of x values using meshgrid
[x1, x2] = meshgrid(perturbation_values(1, :), perturbation_values(2, :));
[dx1, dx2] = meshgrid(df(1, :), df(2, :));

% Initialize a matrix Z
Z = zeros(size(x1));
% Evaluate f element-wise with x1 and x2 using a loop
for i = 1:size(x1, 1)
    for j = 1:size(x1, 1)
        Z(i,j) = f([x1(i,j) x2(i,j)]');
    end
end

if do_plot == 1
% Display the result
figure;
quiver(x1,x2,dx1,dx2);
hold on
contour(x1, x2, Z);
axis equal
hold off
xlabel('x_1');
ylabel('x_2');
title('Gradient of f');
end
end

