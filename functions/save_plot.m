function save_plot(fvals, x_all, alphas, filename, data)
% Plot the convergence of the objective function
subplot(3,1,1);
plot(fvals);
xlabel('Iteration');
ylabel('f');
title("Obj fun value");

subplot(3,1,2);
plot(x_all(1,:)); hold on
plot(x_all(2,:));
xlabel('Iteration');
ylabel('x1, x2');
title('Obj fun x values')

subplot(3,1,3);
plot(alphas);
xlabel('Iteration');
ylabel('alpha');
title('Step length value')

sgt = sgtitle(extractBefore(filename, '/') + ": x0="+data(2,1)+","+data(2,2)+" rho="+data(2,3)+" c="+data(2,4)+"n-iters"+data(2,5));
sgt.FontSize = 10;
saveas(gcf,filename+'.png')
clf
end