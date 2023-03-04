clear
clc
format long

f1 = @(x) (x-2).^2 + x*log(x+3);
f2 = @(x) 5.^x + (2-cos(x)).^2;
f3 = @(x) exp(x)*(x.^3-1) + (x-1)*sin(x);

a = -1;
b = 3;


% Part 1
num1 = zeros();
num2 = zeros();
num3 = zeros();
for i = 1:10
    l = 10^(-i);
    
    [a1, ~, minFound] = GoldenSectionMethod(f1, l, a, b);
    num1(i) = size(a1, 2);
    if minFound == 0
        num1(i) = NaN;
    end
    
    [a2, ~, minFound] = GoldenSectionMethod(f2, l, a, b);
    num2(i) = size(a2, 2);
    if minFound == 0
        num2(i) = NaN;
    end
    
    [a3, ~, minFound] = GoldenSectionMethod(f3, l, a, b);
    num3(i) = size(a3, 2);
    if minFound == 0
        num3(i) = NaN;
    end
end

figure(1);
plot(num1);
hold on;
plot(num2);
plot(num3);
title("Number of function calls vs iterator i")
% where l = 10^(-i)


% Part 2
l = [0.1 0.05 0.01 0.0075 0.005 0.0025];
a1 = zeros();
a2 = zeros();
a3 = zeros();
b1 = zeros();
b2 = zeros();
b3 = zeros();

for i = 1:6
    [a_f1, b_f1, ~] = GoldenSectionMethod(f1, l(i), a, b);
    a1(i, 1:length(a_f1)) = a_f1;
    b1(i, 1:length(b_f1)) = b_f1;
    [a_f2, b_f2, ~] = GoldenSectionMethod(f2, l(i), a, b);
    a2(i, 1:length(a_f2)) = a_f2;
    b2(i, 1:length(b_f2)) = b_f2;
    [a_f3, b_f3, ~] = GoldenSectionMethod(f3, l(i), a, b);
    a3(i, 1:length(a_f3)) = a_f3;
    b3(i, 1:length(b_f3)) = b_f3;
end

figure(2);
plot(nonzeros(a1(1, :)));
hold on;
plot(nonzeros(b1(1,:)));
title("Method Convergence to function minimum");

