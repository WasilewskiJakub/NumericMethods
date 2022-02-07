function ret = F(a, y, x)
% Author: Jakub Wasilewski
%
% The task of the function is to find the vector F (Y).
% F(Y) = [1; y_3; y_4; ...; f(y_1, y_2, ..., y_(m+1)]
% Input:
% a - vector of equation coefficients, the elements of which are functions 
%     of the variable x. The first element of a vector is b.
%     The next elements are function formulas for a_1, a_2, ..., a_n.
% x - argument, value.
% y - vector Y = [x, y, y ', ... y ^ (m-1)];
% Output:
% F - Vertical vector ..

ret = [1; y(3:end); lastelemF(a,y,x)];

end