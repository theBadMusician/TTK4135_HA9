function grad_f = forward_difference_point_gradient(f, x, epsilon)
e_i = eye(length(x));
for i = 1:length(x)
    grad_f_x(i,1) = ( f(x + epsilon*e_i(:, i)) - f(x) ) / epsilon;
end
grad_f = grad_f_x;
end