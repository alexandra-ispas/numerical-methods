function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X, y] = preprocess(path_to_testset, histogram, count_bins);
  [m n] = size(X);
  
  X(1:m, n+1) = 1;
  nr = 0;
  
  for i = 1 : m
    x = X(i, :);
    y1 = dot(w', x);
   
    if (y1 >= 0 & y(i) == 1) || (y1 < 0 & y(i) == -1 )
      nr++;
    endif
   
   endfor
   percentage = double(nr / m);
   
endfunction