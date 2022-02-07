% Author: Jakub Wasilewski
%
% Script is checking correctness of diff_main function.
% The test additionally checks the accuracy of the approximation
% of the differential equation comparing the obtained result with the
% exact one which is a solution to the equation.

% Test 1, we consider the differential equation y'' = sin(x).
% y (0) = 0, y '(0) = 1.
% The exact solution to the equation is: y = 2*x - sin(x)

% Real solving
g = @(x) 2*x - sin(x);

x_min = 0;
x_max = 3*pi;
cond = [0;1];
m = 20;
blad2 = zeros(1,length(m));

rozw = diff_main({ @(x) sin(x), @(x) 0, @(x) 0}, 625, ...
    x_min, x_max, cond, m);

figure(2)
hold on;
fplot(g);
plot(rozw(1,:),rozw(2,:));
hold off;
xlim([0 4*pi]);
title("Solving the differential equation: y'' = sin(x)", ...
    'Interpreter','latex');
legend('$2x-sin(x)$','Heun + AM-2','Interpreter','latex');
xlim([x_min-1 x_max+1]);
ylabel('y(x)','Interpreter','latex')
xlabel('x','Interpreter','latex')
grid on;