clear
clc
format long

f1 = @(x) (x-2).^2 + x*log(x+3);
f2 = @(x) 5.^x + (2-cos(x)).^2;
f3 = @(x) exp(x)*(x.^3-1) + (x-1)*sin(x);

a = -1;
b = 3;

% Part 1
l = 0.01;
times_e1 = zeros();
times_e2 = zeros();
times_e3 = zeros();
epsilon = zeros();

for i = 1:10
    epsilon(i) = 10^(-i);
    
    tic
    [~, ~, minFound] = BisectionMethod(f1, epsilon(i), l, a, b);
    times_e1(i) = toc;
    if minFound == 0
        times_e1(i) = NaN;
    end
    
    tic
    [~, ~, minFound] = BisectionMethod(f2, epsilon(i), l, a, b);
    times_e2(i) = toc;
    if minFound == 0
        times_e2(i) = NaN;
    end
    
    tic
    [~, ~, minFound] = BisectionMethod(f3, epsilon(i), l, a, b);
    times_e3(i) = toc;
    if minFound == 0
        times_e3(i) = NaN;
    end
end

figure(1);
subplot(2, 2, 1);
plot(times_e1);
subplot(2, 2, 2);
plot(times_e2);
subplot(2, 2, 3);
plot(times_e3);
sgtitle("Minimization time for each function")


% Part 2 
epsilon = 0.001;
l = [0.1 0.05 0.01 0.0075 0.005 0.0025];
num_l1 = zeros();
num_l2 = zeros();
num_l3 = zeros();

for i = 1:6
    [a1, ~, minFound] = BisectionMethod(f1, epsilon, l(i), a, b);
    num_l1(i) = 2*size(a1, 2);
    if minFound == 0
        num_l1(i) = NaN;
    end
    
    [a2, ~, minFound] = BisectionMethod(f2, epsilon, l(i), a, b);
    num_l2(i) = 2*size(a2, 2);
    if minFound == 0
        num_l2(i) = NaN;
    end
    
    [a3, ~, minFound] = BisectionMethod(f3, epsilon, l(i), a, b);
    num_l3(i) = 2*size(a3, 2);
    if minFound == 0
        num_l3(i) = NaN;
    end
end

figure(2);
plot(l, num_l1);
hold on;
plot(l, num_l2);
plot(l, num_l3);
title("Number of function calls vs final interval")

% Part 3
l = [0.1 0.05 0.01 0.0075 0.005 0.0025];
epsilon = 0.001;
a1 = zeros();
a2 = zeros();
a3 = zeros();
b1 = zeros();
b2 = zeros();
b3 = zeros();

for i = 1:6
    [a_f1, b_f1, ~] = BisectionMethod(f1, epsilon, l(i), a, b);
    a1(i, 1:length(a_f1)) = a_f1;
    b1(i, 1:length(b_f1)) = b_f1;
    [a_f2, b_f2, ~] = BisectionMethod(f2, epsilon, l(i), a, b);
    a2(i, 1:length(a_f2)) = a_f2;
    b2(i, 1:length(b_f2)) = b_f2;
    [a_f3, b_f3, ~] = BisectionMethod(f3, epsilon, l(i), a, b);
    a3(i, 1:length(a_f3)) = a_f3;
    b3(i, 1:length(b_f3)) = b_f3;
end

figure(3);
plot(nonzeros(a1(1, :)));
hold on;
plot(nonzeros(b1(1,:)));
title("Method Convergence to function minimum");
