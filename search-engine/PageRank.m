function [R1 R2] = PageRank(nume, d, eps)

  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  N = dlmread(nume, " ")(1,1);
  
  val1 = dlmread(nume, " ")(N+2, 1);
  val2 = dlmread(nume, " ")(N+3, 1);
 
  PR1 = sort(R2, "descend");
  
  filename = strcat(nume, ".out");
  
  fid = fopen(filename, "w");
  
  fprintf(fid,"%d\n\n", N);
  
  fprintf(fid,"%f\n", R1);
  fprintf(fid, "\n");
  
  fprintf(fid,"%f\n", R2);
  fprintf(fid,"\n");
  
  j_prev = 0;
  
  for i = 1 : N
    
    fprintf(fid,"%d ", i);
    
    j = find(R2 == PR1(i));
    
    
    if length(j) > 1 && j ~= j_prev
      fprintf(fid,"%d ", j(2));
    elseif j == j_prev 
      fprintf(fid,"%d ", j(1));
    elseif j ~= j_prev & length(j) == 1
      fprintf(fid,"%d ", j(1));
    endif
  
    y = Apartenenta(PR1(i), val1, val2);
    
    fprintf(fid,"%f\n", y);
    
    j_prev = j;
  endfor
  
  fclose(fid);
 
  endfunction