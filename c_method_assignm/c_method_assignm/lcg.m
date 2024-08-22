function output = lcg(a, x, c, m, n)
    output = zeros(1,n);
    
    output(1) = mod((a * x + c), m);
    for (i = 2:n)
        output(i) = mod((a * output(i-1) + c), m);
    end
