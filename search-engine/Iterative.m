function R = Iterative(nume, d, eps)
  N = dlmread(nume, " ")(1,1);
  
  M = Matrice(nume);

  prev_R(1:N, 1) = double(1 / N);
 
  while 1
    
    R = double( (1 - d) / N ) * ones(N,1) + double(d * M * prev_R);
    
    err = norm(R - prev_R);
    
    if err < eps
      R = prev_R;
      return;
    endif
    
    prev_R = R;   
    
  endwhile
  
 endfunction
 
 
 
 
 
 
 