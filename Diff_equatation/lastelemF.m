function f = lastelemF(a,y,x)
% Autor: Jakub Wasilewski 313466
% Funkcja pomocnicza do wyznaczenia ostatniego elementu wektora F:
%   f(y_1,y_2,y_3,...,y_(m+1))
%
% Wejscie:
% a - wektor współczynnikow rownania, ktorego elementy to funkcje zmiennej
%     x, postaci: a_1(x), a_2(x), ..., a_n(x). Rozmiar wektora n.
% x - wartosc argumentu funkcji dla wektora a.
% y - wartosci rzeczywiste, wspolczynniki przez ktore mnozymy kazda z
%     funkcji. Rozmiar wektora n.
%
% Wyjscie:
% f = wynik: b(x) + a_1(x)*y +  a_2(x)*y' + ... + a_n(x)*y^(n-1).

% Author: Jakub Wasilewski
% Auxiliary function to find the last element of vector F:
% f(y_1,y_2,y_3,...,y_(m+1))
%
% Input:
% a - vector of equation coefficients, the elements of which are functions 
%     of the variable x: a_1 (x), a_2 (x), ..., a_n (x). Size is n.
% x - value of the function argument for the vector a.
% y - real values, coefficients by which we multiply each
% of functions. The size of the vector n.
%
% Output:
% f = result: b(x) + a_1(x)*y +  a_2(x)*y' + ... + a_n(x)*y^(n-1).

% b(x) value.
f = (a{1}(x));

for i = 2 : 1 : length(a)
    f = f + (a{i}(x)) * y(i);
end
end