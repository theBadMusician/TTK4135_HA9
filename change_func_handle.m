function f_new = change_func_handle(f)
% CHANGE_FUNC_HANDLE - convert function handle with N-dimensional input to
% two-variable function handle with N inputs
%   f: function handle with N-dimensional input
% 
%   f_new: function handle with two variables (x and y) and N inputs
% 

% Get the number of dimensions in the input to the original function
n = nargin(f);

% Create a new function handle with two input variables (x and y) and N inputs
f_new = @(x,y) f([x y zeros(1,n-2)]);

end