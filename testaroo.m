% Define the function
% f = @(x,y) x.^2 + y.^2;
% 
% Define the input values
% x = [-1, 0, 1];
% y = [-2, 2];
% 
% Create a meshgrid of the input values
% [X,Y] = meshgrid(x,y);
% 
% Evaluate the function for each set of inputs
% Z = f(X,Y);
% 
% Display the results
% disp(Z);

spacing = 0.2;
[X,Y] = meshgrid(-2:spacing:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z, spacing);

quiver(X,Y,DX,DY)
hold on
contour(X,Y,Z)
axis equal
hold off