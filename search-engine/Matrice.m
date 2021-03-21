function [M] = Matrice(nume)
 
  N = dlmread(nume, " ")(1,1);
  
  A = zeros(N);
  
  L = zeros(N, 1);
  
  
  for i = 1 : N
    
    L(i) = dlmread(nume, " ", [i, 1, i, 1]);
    v = dlmread(nume, " ",[i, 2, i, L(i) + 1]);
    
    nr = length(find(v == i));
    L(i) -= nr;
    %adaug 1 unde am vecin
    A(i, v) = 1;
    
  endfor
  
  A = A - diag(diag(A));
  
  M = zeros(N);
 
  [x, y] = find(A == 1);
  
  M(A == 1) = double(1 ./ L(x) );
  
  M = M';
  
 endfunction