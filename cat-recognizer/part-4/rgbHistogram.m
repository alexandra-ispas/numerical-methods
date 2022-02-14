function [sol] = rgbHistogram(path_to_image, count_bins)
 
  A = imread(path_to_image);
  
  a = double(256 / count_bins);
  
  nr_r = zeros(1, count_bins);
  nr_g = zeros(1, count_bins);
  nr_b = zeros(1, count_bins);
  
  for j = 0 : count_bins - 1
    
  
   nr_r(j + 1) = histc (A(:, :, 1)(:), [j * a, j * a + a - 1e-6] )(1);
   nr_g(j + 1) = histc( A(:, :, 2)(:), [j * a, j * a + a - 1e-6])(1);
   nr_b(j + 1) = histc( A(:, :, 3)(:), [j * a, j * a + a - 1e-6])(1);
   
  endfor 
  
  sol = [nr_r, nr_g, nr_b];
  
end
