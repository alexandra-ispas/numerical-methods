function [Q, R] = GrammSchmidt(A)
  
  [m n] = size(A);
  Q = zeros(m,n);
  R = zeros(n);
 
  for j = 1 : n
      
      v = A(:, j);
      for i = 1 : j-1
          R(i, j) = Q(:, i)' * A(:,j);
          v = v - R(i, j) * Q(:,i);
       endfor
        Q(:, j) = v / norm(v);
   endfor
   
endfunction