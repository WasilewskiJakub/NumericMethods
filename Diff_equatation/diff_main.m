function [y] = diff_main(a, n, x_min, x_max, start,m)
% Author: Jakub Wasilewski
%
% Function is used to approximate the solution of a linear equation
% of the differential of any grade by Heun's method and implicit
% 2nd order Euler method (2nd order A-M method).
%
% Our formula:
%   y^(n) = b(x) + a_1(x)y +  + a_2(x)y^(1) + ... + a_n(x)y^(n-1)
%
% y^(i) - i-th derivative of y.
% b(x), a_i(x) - coefficients, formulas of functions of the variable x,
% in the differential equation.
% Input:
% a - vector of equation coefficients, the elements of which are functions 
%     of the variable x. The first element of a vector is b. 
%     next elements are function formulas for a_1, a_2, ..., a_n.
%     When giving formulas a_1...a_n, we have to devide them by b(x).
% x_min - beginning of interval, smallest value of x.
% x_max - end of interval, the largest value of x.
% [x_min, x_max] - interval of x.
% n - number of sub-intervals in the interval [x_min, x_max], we get:
%     x_min = x_1, x_2, x_3, ..., x_n+1 = x_max.
% start - vertical vector of the initial equation conditions. 
%      Amount of elements of the vector is equal to the degree of equation, 
%      the i-th element is the value of y ^ (i-1), at the starting point.
% m - the number of iterations of the AM-2 method. when m = 0,
%     AM2 is not working, m >= 1 is working.
% Output:
% y - vector (2xn), of approximate values of the searched function y and
% Designated x arguments.
%     1 row: [x_1, x_2, ..., x_n+1];
%     2 row: [y(x_1), y(x_2), ..., y(x_n+1)].

% Default values for input arguments.
if(nargin < 6)
    m = 10;
end
if(nargin < 5)
   start = zeros(length(a));
end
if(nargin < 4)
   x_max = 5;
end
if(nargin < 3)
   x_min = 0;
end
if(nargin < 2)
   n = 15;
end

if(size(a,1) < size(a,2))
    a = a';
end

% vector for xs.
x = linspace(x_min,x_max,n+1);

% gap between 2 xs.
h = x(2)-x(1); 

Y = zeros(size(start,1) + 1,length(x));
Y(1,1:end) = x(1:end);
Y(2:end,1) = start(1:end);

for i = 2 : 1 : length(x)
        
    Y_before = Y(:,i-1); % Previus value of Y
    Fk = F(a,Y_before,x(i-1)); % Previus value of F
    K = F(a,Y_before + h*Fk,x(i)); % K for current iteration
    yk1 = Y_before + 1/2*h*(Fk + K); % current value of Y
    
    % The approximation obtained by the Heun method, we correct m times by 
    % the 2nd order A-M method
    for ii = 1 : 1 : m
        yk1 = Y_before + 1/2 * h * (F(a,yk1,x(i)) + Fk);
    end
    % calculated approximation
    Y(:,i) = yk1;
end

% Matrix A = [1; y; y'; y''; ...;y^(m-1)], our solving is,
% y(x) which is the second row in A.

y = Y(1:2,:);
end