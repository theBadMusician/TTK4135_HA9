% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 1 - Unconstrained Optimization

%  Symbolic variables x_1 and x_2
close all
clear
syms x_1 x_2

% Define the objective function and its gradient
% f = @(x_1, x_2) (x_1^2 + 4*x_2^2 - 4*x_1 - 8*x_2 + 13);
% grad_f = @(x_1, x_2) [2*x_1 - 4; 8*x_2 - 8];
% hess_f = [2, 0; 0, 8];

% Rosenbrock function
% f = @(x_1, x_2) 100*(x_2 - x_1^2)^2 + (1 - x_1)^2;
% grad_f = @(x_1, x_2) [-400*x_2*x_1+400*x_1^3+2*x_1-2; 200*x_2-200*x_1^2];
% hess_f = @(x_1, x_2) [-400*x_2+1200*x_1^2+2, -400*x_1; -400*x_2, 200];

% Modified Rosenbrock function
f = @(x_1, x_2) 100*(x_2 - x_1^2) + (1 - x_1)^2;
% grad_f = @(x_1, x_2) [-400*x_2*x_1+400*x_1^3+2*x_1-2; 200*x_2-200*x_1^2];
% hess_f = @(x_1, x_2) [-400*x_2+1200*x_1^2+2, -400*x_1; -400*x_2, 200];

fsurf(f)

%% a
% Program the steepest descent and Newton algorithms using the backtracking line
% search, Algorithm 3.1. Use them to minimize the Rosenbrock function (2.22). Set the initial
% step length α0=1 and print the step length used by each method at each iteration. First try
% the initial point x0=(1.2, 1.2)T and then the more difficult starting point x0=(−1.2, 1)T .

% Define the initial point and the stopping criteria
% x0 = [0;0];
x0 = [1.2;1.2];
% x0 = [-1.2;1];
epsilon = 1e-6;

% % Steepest descent
% rho_sd = 0.1;
% c_sd = 0.1;
% [fvals_sd, x_all_sd, alphas_sd] = steepest_descent(f, grad_f, x0, epsilon, rho_sd, c_sd);
% iter_sd = length(alphas_sd);
% data_sd = ["rho","c","n_iters";rho_sd,c_sd,iter_sd];
% 
% filename = "sd_rho=" + rho_sd + "_c=" + c_sd;
% mkdir("SD/"+filename);
% save("SD/"+filename+"/"+filename+".mat", "data_sd")
% save_plot(fvals_sd, x_all_sd, alphas_sd, "SD/"+filename+"/"+filename);
% 
% % Newton Method
% rho_nm = 0.0001;
% c_nm = 0.1;
% [fvals_nm, x_all_nm, alphas_nm] = newton_method(f, grad_f, hess_f, x0, epsilon, rho_nm, c_nm);
% iter_nm = length(alphas_nm);
% data_nm = ["rho","c","n_iters";rho_nm,c_nm,iter_nm];
% 
% filename = "nm_rho=" + rho_nm + "_c=" + c_nm;
% mkdir("NM/"+filename);
% save("NM/"+filename+"/"+filename + ".mat", "data_nm")
% save_plot(fvals_nm, x_all_nm, alphas_nm, "NM/"+filename+"/"+filename);

% BFGS Method
rho_bfgs = 0.01;
c_bfgs = 10e-4;

beta = 1;
H0 = eye(2);

[fvals_bfgs, x_all_bfgs, alphas_bfgs] = bfgs(f, grad_f, x0, H0, beta, epsilon, rho_bfgs, c_bfgs);
iter_bfgs = length(alphas_bfgs)
data_bfgs = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_bfgs,c_bfgs,iter_bfgs];

filename = "bfgs_x0="+x0(1)+","+x0(2)+"_rho=" + rho_bfgs + "_c=" + c_bfgs;
mkdir("BFGS/"+filename);
save("BFGS/"+filename+"/"+filename + ".mat", "data_bfgs")
save_plot(fvals_bfgs, x_all_bfgs, alphas_bfgs, "BFGS/"+filename+"/"+filename, data_bfgs);

% BFGS Method  w/ modified H0
rho_modH0_bfgs = 0.01;
c_modH0_bfgs = 10e-4;

beta = 1;
H0 = eye(2);

[fvals_modH0_bfgs, x_all_modH0_bfgs, alphas_modH0_bfgs] = modH0_bfgs(f, grad_f, x0, H0, beta, epsilon, rho_modH0_bfgs, c_modH0_bfgs);
iter_modH0_bfgs = length(alphas_modH0_bfgs)
data_modH0_bfgs = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_modH0_bfgs,c_modH0_bfgs,iter_modH0_bfgs];

filename = "modH0_bfgs_x0="+x0(1)+","+x0(2)+"_rho=" + rho_modH0_bfgs + "_c=" + c_modH0_bfgs;
mkdir("modH0_BFGS/"+filename);
save("modH0_BFGS/"+filename+"/"+filename + ".mat", "data_modH0_bfgs")
save_plot(fvals_modH0_bfgs, x_all_modH0_bfgs, alphas_modH0_bfgs, "modH0_BFGS/"+filename+"/"+filename, data_modH0_bfgs);


close all
