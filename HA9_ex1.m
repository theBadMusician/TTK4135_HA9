% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 1 - Unconstrained Optimization

%  Symbolic variables x_1 and x_2
close all


% Define the objective function and its gradient
[fnc_name, f, grad_f, hess_f] = get_function("rosenbrock");
functionname = fnc_name+"-";
% fsurf(change_func_handle(f));

%% a, b, c
% Program the steepest descent and Newton algorithms using the backtracking line
% search, Algorithm 3.1. Use them to minimize the Rosenbrock function (2.22). Set the initial
% step length α0=1 and print the step length used by each method at each iteration. First try
% the initial point x0=(1.2, 1.2)T and then the more difficult starting point x0=(−1.2, 1)T .

% Define the initial point and the stopping criteria
% x0 = [0;0];
x0 = [1.2;1.2];
% x0 = [-1.2;1];
epsilon = 1e-6;

% rho = 0.01;
% c = 0.0001;

%% Steepest descent
rho_sd = 0.5;
c_sd = 0.3;
[fvals_sd, x_all_sd, alphas_sd] = steepest_descent(f, grad_f, x0, epsilon, rho_sd, c_sd);
iter_sd = length(alphas_sd)
data_sd = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_sd,c_sd,iter_sd];

foldername = "ex1_data/"+functionname+"SD/";
filename = "sd_x0="+x0(1)+","+x0(2)+"_rho=" + rho_sd + "_c=" + c_sd;
mkdir(foldername+filename);
save(foldername+filename+"/"+filename + ".mat", "data_sd")
save_plot(fvals_sd, x_all_sd, alphas_sd, foldername+filename+"/"+filename, data_sd);

%% Newton Method
rho_nm = 0.01;
c_nm = 0.01;
[fvals_nm, x_all_nm, alphas_nm] = newton_method(f, grad_f, hess_f, x0, epsilon, rho_nm, c_nm);
iter_nm = length(alphas_nm)
data_nm = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_nm,c_nm,iter_nm];

foldername = "ex1_data/"+functionname+"NM/";
filename = "nm_x0="+x0(1)+","+x0(2)+"_rho=" + rho_nm + "_c=" + c_nm;
mkdir(foldername+filename);
save(foldername+filename+"/"+filename + ".mat", "data_nm")
save_plot(fvals_nm, x_all_nm, alphas_nm, foldername+filename+"/"+filename, data_nm);

%% BFGS Method
rho_bfgs = 0.3;
c_bfgs = 10e-4;

beta = 1;
H0 = eye(2);

[fvals_bfgs, x_all_bfgs, alphas_bfgs] = bfgs(f, grad_f, x0, H0, beta, epsilon, rho_bfgs, c_bfgs);
iter_bfgs = length(alphas_bfgs)
data_bfgs = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_bfgs,c_bfgs,iter_bfgs];

foldername = "ex1_data/"+functionname+"BFGS/";
filename = "bfgs_x0="+x0(1)+","+x0(2)+"_rho=" + rho_bfgs + "_c=" + c_bfgs;
mkdir(foldername+filename);
save(foldername+filename+"/"+filename + ".mat", "data_bfgs")
save_plot(fvals_bfgs, x_all_bfgs, alphas_bfgs, foldername+filename+"/"+filename, data_bfgs);

%% BFGS Method  w/ modified H0
rho_modH0_bfgs = 0.1;
c_modH0_bfgs = 0.01;

beta = 1;
H0 = eye(2);

[fvals_modH0_bfgs, x_all_modH0_bfgs, alphas_modH0_bfgs] = modH0_bfgs(f, grad_f, x0, H0, beta, epsilon, rho_modH0_bfgs, c_modH0_bfgs);
iter_modH0_bfgs = length(alphas_modH0_bfgs)
data_modH0_bfgs = ["x0_1","x0_2","rho","c","n_iters";x0(1),x0(2),rho_modH0_bfgs,c_modH0_bfgs,iter_modH0_bfgs];

foldername = "ex1_data/"+functionname+"modH0_BFGS/";
filename = "modH0_bfgs_x0="+x0(1)+","+x0(2)+"_rho=" + rho_modH0_bfgs + "_c=" + c_modH0_bfgs;
mkdir(foldername+filename);
save(foldername+filename+"/"+filename + ".mat", "data_modH0_bfgs")
save_plot(fvals_modH0_bfgs, x_all_modH0_bfgs, alphas_modH0_bfgs, foldername+filename+"/"+filename, data_modH0_bfgs);


%%
close all