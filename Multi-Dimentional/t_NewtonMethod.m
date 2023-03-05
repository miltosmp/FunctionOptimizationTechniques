clc
clear 
format long

syms x y f(x,y) g
f(x,y) = (x^5) * exp(-x^2 - y^2);

% For Newton Method, we want the Hessian matrix of the function to be
% positive defined. That means that all of its eigenvalues should be
% possitive.

hessianf = hessian(f);
f_h1 = hessianf(-1,1);
f_h2 = hessianf(0,0);
f_h3 = hessianf(1,-1);
e1 = eig(f_h1)
e2 = eig(f_h2)
e3 = eig(f_h3)


% All the Hessians has at least one non-positive eigenvalue. So, Newton
% Method cannot work correctly.