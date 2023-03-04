function [a_f, b_f] = FibonacciMethod(f, epsilon, l, a1, b1)
    a = zeros();
    b = zeros();
    x1 = zeros();
    x2 = zeros();
    f1 = zeros();
    f2 = zeros();
    
    a(1) = a1;
    b(1) = b1;
    
    F_n = (b(1)-a(1))/l;
    n = 1;
    while fib(n) < F_n
        n = n+1;
    end
    
    x1(1) = a(1) + (fib(n-2)/fib(n))*(b(1)-a(1));
    x2(1) = a(1) + (fib(n-1)/fib(n))*(b(1)-a(1));
    f1(1) = f(x1(1));
    f2(1) = f(x2(1));

    for k = 1:n-2
        if f1(k) > f2(k)
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + (fib(n-k)/fib(n-k+1))*(b(k+1)-a(k+1));
            f1(k+1) = f2(k);
            f2(k+1) = f(x2(k+1));
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x1(k+1) = a(k+1) + (fib(n-k-1)/fib(n-k+1))*(b(k+1)-a(k+1));
            x2(k+1) = x1(k);
            f1(k+1) = f(x1(k+1));
            f2(k+1) = f1(k);
        end
    end
    
    x1(n) = x1(n-1);
    x2(n) = x1(n-1) + epsilon;
    f1(n) = f1(n-1);
    f2(n) = f(x2(n));
    
    if f1(n) > f2(n)
        a(n) = x1(n);
        b(n) = b(n-1);
    else
        a(n) = a(n-1);
        b(n) = x2(n);
    end
    a_f = a;
    b_f = b;
end