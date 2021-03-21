function [x] = SST(A, b)
    [m n] = size(A);
    x = zeros(n, 1);
   
    x(n) = b(n) / A(n, n);
    
    for i = n-1 : -1 : 1
        x(i) = double( (b(i)-A(i, i + 1 : n) * x(i + 1 : n) ) / A(i, i) );
        
    endfor

endfunction
   