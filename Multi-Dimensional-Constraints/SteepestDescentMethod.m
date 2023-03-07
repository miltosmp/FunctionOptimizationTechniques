function [x_s, y_s] = SteepestDescentMethod(f, x1, y1, epsilon, gamma_k)
    
    gradf = gradient(f);
    f_p = gradf(x1, y1);
    
    x_s = zeros();
    y_s = zeros();
    x_s(1) = x1;
    y_s(1) = y1;
    
    k=1;
    while norm(f_p) > epsilon
        x_s(k+1) = x_s(k) - gamma_k*f_p(1);
        y_s(k+1) = y_s(k) - gamma_k*f_p(2);
    
        f_p = gradf(x_s(k+1), y_s(k+1));
        k = k+1;
    end

end