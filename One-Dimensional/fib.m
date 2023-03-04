function fib = fib(n)
    fib_n = zeros(n, 1);
    fib_n(1) = 1;
    fib_n(2) = 1;
    for i = 3:n
        fib_n(i) = fib_n(i-1) + fib_n(i-2);
    end
    fib = fib_n(n);
end