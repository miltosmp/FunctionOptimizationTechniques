clc
clear 
format long

syms x y f(x,y) g
f(x,y) = (x^5) * exp(-x^2 - y^2);

% Plot the objective function
figure(1);
fsurf(f);

% Plot the objective function with different format
figure(2);
fcontour(f);

gradf = gradient(f);
[x_g, y_g] = meshgrid(-3:0.1:3, -3:0.1:3);
f_g = gradf(x_g, y_g);

% Plot the gradient of the objective function
figure(3);
quiver(x_g, y_g, vpa(f_g(1)), vpa(f_g(2)));