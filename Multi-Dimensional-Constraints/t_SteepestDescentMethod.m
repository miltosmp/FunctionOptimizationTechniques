clc
clear 
format long

syms x1 y2 f(x1,x2) g
f(x1,x2) = (1/3)*x1^2 +3*x2^2;
figure(1);
fsurf(f);
title("Objective Function Plot");

x1_0 = 2;
x2_0 = -4;

% i) gamma_k = 0.1
gamma_k = 0.1;
[x1_i, x2_i] = SteepestDescentMethod(f, x1_0, x2_0, 0.001, gamma_k);

figure(2);
fcontour(f);
hold on;
scatter(x1_i, x2_i, 'r', 'filled');
title("Starting point: (2,-4)  and constant gamma\_k = 0.1");


% ii) gamma_k = 0.3
gamma_k = 0.3;
[x1_ii, x2_ii] = SteepestDescentMethod(f, x1_0, x2_0, 0.001, gamma_k);

figure(3);
fcontour(f);
hold on;
scatter(x1_ii, x2_ii, 'r', 'filled');
title("Starting point: (2,-4)  and constant gamma\_k = 0.3");


% iii) gamma_k = 3
gamma_k = 3;
[x1_iii, x2_iii] = SteepestDescentMethod(f, x1_0, x2_0, 0.001, gamma_k);

figure(4);
fcontour(f);
hold on;
scatter(x1_iii, x2_iii, 'r', 'filled');
title("Starting point: (2,-4)  and constant gamma\_k = 3");


% iv) gamma_k = 5
gamma_k = 5;
[x1_iv, x2_iv] = SteepestDescentMethod(f, x1_0, x2_0, 0.001, gamma_k);

figure(5);
fcontour(f);
hold on;
scatter(x1_iv, x2_iv, 'r', 'filled');
title("Starting point: (2,-4)  and constant gamma\_k = 5");

% For gamma_k > 1/3 the method becomes unstable. Thats the reason the
% algorithm is not able to find the minimum for gamma_k = 3, 5
