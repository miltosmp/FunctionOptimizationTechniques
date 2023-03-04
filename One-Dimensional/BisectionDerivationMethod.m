function [a_f, b_f] = BisectionDerivationMethod(f, l, a1, b1)
    a = zeros();
    b = zeros();
    x = zeros();
    a(1) = a1;
    b(1) = b1;
    
    epsilon = 1e-10;
    f_prime = @(x) (f(x+epsilon)-f(x))/epsilon;
    f_p = zeros();
    
    n = 1;
    while (1/2)^n > l/(b(1)-a(1))
        n = n+1;
    end
    
    for k = 1:n
        x(k) = (a(k)+b(k))/2;
        f_p(k) = f_prime(x(k));
        if f_p(k) == 0
            break;
        elseif f_p(k) > 0
            a(k+1) = a(k);
            b(k+1) = x(k);
        else
            a(k+1) = x(k);
            b(k+1) = b(k);
        end
    end
    
    a_f = a;
    b_f = b;
end