function [sol] = hsvHistogram(path_to_image, count_bins)
  
  A = imread(path_to_image);
  A = double(A);
  [h, s, v] = RGB2HSV(A(:, :, 1), A(:, :, 2), A(:, :, 3));

  
  a = double(1.01 / count_bins);
  
  nr_h = zeros(1, count_bins);
  nr_s = zeros(1, count_bins);
  nr_v = zeros(1, count_bins);
  
  for j = 0 : count_bins - 1
    
    
    nr_h(j+1) = histc (h(:), [j * a, j * a + a - 1e-6] )(1);
     
    nr_s(j+1) = histc( s(:), [j * a, j * a + a - 1e-6])(1);
     
    nr_v(j+1) = histc( v(:), [j * a, j * a + a - 1e-6])(1);
     
  endfor 
  
  sol = [nr_h, nr_s, nr_v];
   
end
