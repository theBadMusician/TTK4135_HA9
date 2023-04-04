% Define the function
f = @(x) x(1)^2 + 2*x(2)^2; % for example, we use a simple quadratic function of two variables
f = @(x) 100*(x(2) - x(1)^2) + (1 - x(1))^2;

% Define the step size
epsilon = 0.1;

% Define the range of x values
x_min = [-1;-1];
x_max = [1;1];
n_steps = 10;

% Create the range of x values using meshgrid
x1_values = linspace(x_min(1), x_max(1), n_steps);
x2_values = linspace(x_min(2), x_max(2), n_steps);
[x1, x2] = meshgrid(x1_values, x2_values);
x_values = [x1(:), x2(:)];

% Define the unit vectors in each direction
e_i = eye(length(x_min));

% Initialize the gradient array
df = zeros(length(x_values), length(x_min));

% Calculate the gradient using the forward difference algorithm for each direction
for i = 1:length(x_min)
    for j = 1:length(x_values)
        if j == 1
            % Forward difference approximation at the first point
            df(j,i) = (f(x_values(j,:) + epsilon*e_i(:,i)') - f(x_values(j,:))) / epsilon;
        elseif j == length(x_values)
            % Backward difference approximation at the last point
            df(j,i) = (f(x_values(j,:)) - f(x_values(j,:) - epsilon*e_i(:,i)')) / epsilon;
        else
            % Central difference approximation for intermediate points
            df(j,i) = (f(x_values(j,:) + epsilon*e_i(:,i)') - f(x_values(j,:) - epsilon*e_i(:,i)')) / (2*epsilon);
        end
    end
end

% Display the result
figure;
quiver(x_values(:,1), x_values(:,2), df(:,1), df(:,2));
xlabel('x_1');
ylabel('x_2');
title('Gradient of f');
