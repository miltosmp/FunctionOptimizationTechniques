function [x_s, y_s] = NewtonMethod(f, x, y, x1, y1, epsilon, option)
    
    gradf = gradient(f);
    hessianf = hessian(f);
    f_p = gradf(x1, y1);
    f_h = hessianf(x1, y1);
    
    x_s = zeros();
    y_s = zeros();
    x_s(1) = x1;
    y_s(1) = y1;
    
    % Option 0 for gamma_k stable
    if option == 0
        gamma_k = 1;
        k=1;
        while norm(f_p) > epsilon
            d = - inv(f_h) * f_p;
            x_s(k+1) = x_s(k) + gamma_k*d(1);
            y_s(k+1) = y_s(k) + gamma_k*d(2);
    
            f_p = gradf(x_s(k+1), y_s(k+1));
            f_h = hessianf(x_s(k+1), y_s(k+1));
            k = k+1;
        end
    end
    
    % Option 1 for gamma_k to minimize f(xk - gamma_k*dk)
    if option == 1
        syms g
        k = 1;
        while norm(f_p) > epsilon
            fn = vpa(subs(f, [x, y], [x_s(k) - g*f_p(1), y_s(k) - g*f_p(2)]));
            gamma_k = solve(diff(fn, g), g);
            gamma_k = min(gamma_k(gamma_k >= 0));
            
            d = - inv(f_h) * f_p;
            x_s(k+1) = x_s(k) + gamma_k*d(1);
            y_s(k+1) = y_s(k) + gamma_k*d(2);
    
            f_p = gradf(x_s(k+1), y_s(k+1));
            f_h = hessianf(x_s(k+1), y_s(k+1));
            k = k+1;
        end
    end
    
    % Option 2 gamma_k according to Armijo rule
    if option == 2
        
        k = 1;
        s = 1.5;
        a = 0.01;
        b = 1/5;
        mk = 1;
        gamma_k = s;
        while norm(f_p) > epsilon
            while f(x_s(k), y_s(k)) - f(x_s(k) - gamma_k*f_p(1), y_s(k) - gamma_k*f_p(2)) <= -a*b^mk*s*(-transpose(f_p)*f_p)
                mk = mk + 1;
            end
            gamma_k = s*b^mk;
            
            d = - inv(f_h) * f_p;
            x_s(k+1) = x_s(k) + gamma_k*d(1);
            y_s(k+1) = y_s(k) + gamma_k*d(2);
    
            f_p = gradf(x_s(k+1), y_s(k+1));
            f_h = hessianf(x_s(k+1), y_s(k+1));
            k = k+1; 
        end
    end
end