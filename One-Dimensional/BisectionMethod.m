function [a_f, b_f, minFound] = BisectionMethod(f, epsilon, l, a1, b1)
    a = zeros();
    b = zeros();
    x1 = zeros();
    x2 = zeros();
    
    a(1) = a1;
    b(1) = b1;
    
    k = 1;
    while b(k) - a(k) > l
        x1(k) = (a(k)+b(k))/2 - epsilon;
        x2(k) = (a(k)+b(k))/2 + epsilon;
        if f(x1(k)) < f(x2(k))
            a(k+1) = a(k);
            b(k+1) = x2(k);
        else
            a(k+1) = x1(k);
            b(k+1) = b(k);
        end
        k = k + 1;
        if k > 1e5
            a_f = zeros();
            b_f = zeros();
            minFound = 0;
            return
        end
    end
    a_f = a;
    b_f = b;
    minFound = 1;
end
