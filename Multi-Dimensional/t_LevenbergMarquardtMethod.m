clc
clear 
format long

syms x y f(x,y) g
f(x,y) = (x^5) * exp(-x^2 - y^2);

% Part1
x0 = 0;
y0 = 0;
[x_s0, y_s0] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 0);
[x_s1, y_s1] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 1);
[x_s2, y_s2] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 2);

figure(1);
fcontour(f);
hold on;
scatter(x_s0, y_s0, 'r', 'filled');
title("Starting point: (0,0)  and constant gamma\_k = 0.5");


figure(2);
fcontour(f);
hold on;
scatter(x_s1, y_s1, 'r', 'filled');
title("Starting point: (0,0) and gamma\_k to minimize f(xk - gamma\_k*dk)");


figure(3);
fcontour(f);
hold on;
scatter(x_s2, y_s2, 'r', 'filled');
title("Starting point: (0,0) and gamma\_k according to Armijo rule");


% Part2
x0 = -1;
y0 = 1;
[x_s0, y_s0] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 0);
[x_s1, y_s1] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 1);
[x_s2, y_s2] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 2);

figure(4);
fcontour(f);
hold on;
scatter(x_s0, y_s0, 'r', 'filled');
title("Starting point: (-1,1)  and constant gamma\_k = 0.5");


figure(5);
fcontour(f);
hold on;
scatter(x_s1, y_s1, 'r', 'filled');
title("Starting point: (-1,1) and gamma\_k to minimize f(xk - gamma\_k*dk)");


figure(6);
fcontour(f);
hold on;
scatter(x_s2, y_s2, 'r', 'filled');
title("Starting point: (-1,1) and gamma\_k according to Armijo rule");


% Part3
x0 = 1;
y0 = -1;
[x_s0, y_s0] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 0);
[x_s1, y_s1] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 1);
[x_s2, y_s2] = LevenbergMarquardtMethod(f, x, y, x0, y0, 0.01, 2);

figure(7);
fcontour(f);
hold on;
scatter(x_s0, y_s0, 'r', 'filled');
title("Starting point: (1,-1)  and constant gamma\_k = 0.5");


figure(8);
fcontour(f);
hold on;
scatter(x_s1, y_s1, 'r', 'filled');
title("Starting point: (1,-1) and gamma\_k to minimize f(xk - gamma\_k*dk)");


figure(9);
fcontour(f);
hold on;
scatter(x_s2, y_s2, 'r', 'filled');
title("Starting point: (1,-1) and gamma\_k according to Armijo rule");
