function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  
  n = length(G_rowptr) - 1;
  x = zeros(n,1);
  prev_x = x;
  err = tol + 1;
  
  while err >= tol
    
    x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
    err = norm(x - prev_x);
    prev_x = x;
    
  endwhile
  
endfunction
