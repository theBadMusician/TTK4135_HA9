function array = perturbation_array(x0, N, epsilon)
array = zeros(length(x0),N+1);
higher_values = zeros(length(x0),N/2);
lower_values = zeros(length(x0),N/2);
for i = 1:length(x0)
    % create the arrays using linspace function
    higher_values(i, :) = linspace(x0(i) + epsilon, x0(i) + (N/2)*epsilon, N/2);
    lower_values(i, :) = fliplr(linspace(x0(i, 1) - epsilon, x0(i, 1) - (N/2)*epsilon, N/2)); 
    % combine the arrays into one
    array(i, :) = [lower_values(i, :), x0(i, 1), higher_values(i, :)];
end

end
