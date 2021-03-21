function R = Algebraic(nume, d)

  N = dlmread(nume, " ")(1,1);
  
  M = Matrice(nume);
  
  prev_R(1:N, 1) = double(1 / N);  
  
  while 1
    
    R = d * M * prev_R + double((1 - d) / N) * ones(N,1);
    
    if R == prev_R
      
      return;
    endif
    
    prev_R = R;
  endwhile
  
  T = eye(N) - d * M;
  [Q, R_] = GrammSchmidt(T);
  v = double((1 - d) / N) * ones(N, 1);
  R = SST(R_, (Q' * V));

endfunction	