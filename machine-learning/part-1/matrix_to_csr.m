function [values, colind, rowptr] = matrix_to_csr(A)
 [n m] = size(A);
  a = 1;
  b = 1;
  c = 1;
  nz = 0; %numarul de valori nenunle din cerinta
  
  rowptr = zeros(1, n + 1);
  
  for i = 1:n
    for j = 1:m

        if A(i,j) ~= 0
          colind(a++) = j;
          values(b++) = A(i,j);
          
          if (A(i, 1 : j-1) == 0) || (j == 1)
             %adaug in rowptr pozitia din values
             rowptr(c++) = b-1;
          endif
          
          nz ++;
        endif
        
     endfor
  endfor
  rowptr(c) = nz + 1;
  
endfunction