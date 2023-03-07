clc
clear 
format long

syms x1 y2 f(x1,x2) g
f(x1,x2) = (1/3)*x1^2 +3*x2^2;
figure(1);
fsurf(f);
title("Objective Function Plot");

x_limit = [-10 5];
y_limit = [-8 12];


% Part1
x1_0 = 5;
x2_0 = -5;

gamma_k = 0.05;
s_k = 5;
[x1_si, x2_si] = SteepestDescentMethodwithProjection(f, x1_0, x2_0, x_limit, y_limit, 0.01, gamma_k, s_k);

figure(2);
fcontour(f);
hold on;
scatter(x1_si, x2_si, 'r', 'filled');
title("Starting point: (5,-5), constant gamma\_k = 0.05 and s\_k = 5");


% Part2
x1_0 = -5;
x2_0 = 10;

gamma_k = 0.05;
s_k = 15;
[x1_sii, x2_sii] = SteepestDescentMethodwithProjection(f, x1_0, x2_0, x_limit, y_limit, 0.01, gamma_k, s_k);

figure(3);
fcontour(f);
hold on;
scatter(x1_sii, x2_sii, 'r', 'filled');
title("Starting point: (-5,10), constant gamma\_k = 0.05 and s\_k = 15");


% Part3
x1_0 = 8;
x2_0 = -10;

gamma_k = 0.2;
s_k = 0.1;
[x1_siii, x2_siii] = SteepestDescentMethodwithProjection(f, x1_0, x2_0, x_limit, y_limit, 0.01, gamma_k, s_k);

figure(4);
fcontour(f);
hold on;
scatter(x1_siii, x2_siii, 'r', 'filled');
title("Starting point: (8,-10), constant gamma\_k = 0.2 and s\_k = 0.1");


