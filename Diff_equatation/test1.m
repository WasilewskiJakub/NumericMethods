% Author: Jakub Wasilewski 313 466
%
% Script is checking correctness of diff_main function.
% The test additionally checks the accuracy of the approximation
% of the differential equation comparing the obtained result with the
% exact one which is a solution to the equation.

% Test 1, we consider the differential equation y '' = 2y '- y.
% y (0) = 0, y '(0) = 1.
% The exact solution to the equation is: y = xe ^ x

% Real solving
g = @(x) x.*exp(x);

x_min = 0;
x_max = 5;
cond = [0; 1];
m = 0;

rozw = diff_main({ @(x) 0, @(x) -1, @(x) 2}, 512, ...
    x_min, x_max, cond, m);

figure(1)
clf;
hold on;
fplot(g);
plot(rozw(1,:),rozw(2,:));
hold off;
title("Solving the differential equation: y'' = 2y' - y", ...
    'Interpreter','latex');
legend('$xe^{x}$','Heun aprox','Interpreter','latex');
xlim([x_min-1 x_max+1]);
ylim([-100 1100]);
ylabel('y(x)','Interpreter','latex')
xlabel('x','Interpreter','latex')
grid on;
