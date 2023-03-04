function [a_f, b_f, minFound] = GoldenSectionMethod(f, l, a1, b1)
    a = zeros();
    b = zeros();
    x1 = zeros();
    x2 = zeros();
    f1 = zeros();
    f2 = zeros();
    
    a(1) = a1;
    b(1) = b1;
    gamma = 0.618;
    
    x1(1) = a(1) + (1-gamma)*(b(1)-a(1));
    x2(1) = a(1) + gamma*(b(1)-a(1));
    f1(1) = f(x1(1));
    f2(1) = f(x2(1));
    
    k = 1;
    while b(k) -  a(k) > l
        if f1(k) > f2(k) 
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + gamma*(b(k+1)-a(k+1));
            f1(k+1) = f2(k);
            f2(k+1) = f(x2(k+1));
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x1(k+1) = a(k+1) + (1-gamma)*(b(k+1)-a(k+1));
            x2(k+1) = x1(k);
            f1(k+1) = f(x1(k+1));
            f2(k+1) = f1(k);
        end
        k = k+1;
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