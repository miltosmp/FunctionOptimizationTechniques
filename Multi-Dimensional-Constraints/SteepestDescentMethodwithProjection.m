function [x_s, y_s] = SteepestDescentMethodwithProjection(f, x1, y1, x_limit, y_limit, epsilon, gamma_k, s_k)
    
    gradf = gradient(f);
    f_p = gradf(x1, y1);
    
    x_s = zeros();
    y_s = zeros();
    x_bar = zeros();
    y_bar = zeros();
    x_s(1) = x1;
    y_s(1) = y1;
    
    k=1;
    while norm(f_p) > epsilon
        p1 = x_s(k) - s_k*f_p(1);
        p2 = y_s(k) - s_k*f_p(2);
        
        if p1 <= x_limit(1)
            x_bar(k) = x_limit(1);
        elseif p1 >= x_limit(2)
            x_bar(k) = x_limit(2);
        else
            x_bar(k) = p1;    
        end
        
        if p2 <= y_limit(1)
            y_bar(k) = y_limit(1);
        elseif p2 >= y_limit(2)
            y_bar(k) = y_limit(2);
        else
            y_bar(k) = p2;    
        end
        
        x_s(k+1) = x_s(k) + gamma_k*(x_bar(k) - x_s(k));
        y_s(k+1) = y_s(k) + gamma_k*(y_bar(k) - y_s(k));
    
        f_p = gradf(x_s(k+1), y_s(k+1));
        k = k+1;
        
        if k >= 1500
            fprintf("The method does not converge\n");
            break;
        end
    end

end