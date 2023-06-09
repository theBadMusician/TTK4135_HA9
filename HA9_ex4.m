% Exercise 9 - Oimization Algorithms
% Benjaminas Visockis V23


%% Problem 4 - The Nelder-Mead Algorithm

% b, c
% x0 = [2;-2]; % initial point
% x0 = [1.2;1.2];
% x0 = [-1.2;1];
x0 = [0;-2];

% Algorithm options
funtol = 1e-5; % Tolerence for difference in function values at simplex points - "flatness"
xtol = 1e-5;   % Maximum coordinate difference between the current best point and the 
               % other points in the simplex - "size" of simplex
iterlim = 1e5; % Max number of iterations

[x, fval, f_iter, x_iter] = nelder_mead(x0, funtol, xtol, iterlim, 'report');
fig = gcf;
filename = "x0="+x0(1)+","+x0(2)+"-funtol="+funtol+"-xtol="+xtol;
saveas(fig, "ex4_data/"+filename+".png");

plot_iter_rosenbrock(x_iter);
isofig = gcf;
filename = "x0="+x0(1)+","+x0(2)+"-funtol="+funtol+"-xtol="+xtol+"-isocurve";
saveas(fig, "ex4_data/"+filename+".png");

close all