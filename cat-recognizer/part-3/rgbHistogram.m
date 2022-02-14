function [sol] = rgbHistogram(path_to_image, count_bins)
 
 %prelucrez imaginea
  A = imread(path_to_image);
  
  %calculez raportul de la interval
  a = double(256 / count_bins);
  
  %initializez vectorii ce contin numarul de elemente din interval 
  %pentru fiecare culoare
  nr_r = zeros(1, count_bins);
  nr_g = zeros(1, count_bins);
  nr_b = zeros(1, count_bins);
  
  %fiecare culoare va avea in vector count_bins elemente asociate
  
  for j = 0 : count_bins - 1
    
   %calculez numarul de elemente din interval pentru fiecare colara
   %si le adaug in solutie
    
   nr_r(j + 1) = histc (A(:, :, 1)(:), [j * a, j * a + a - 1e-6] )(1);

   nr_g(j + 1) = histc( A(:, :, 2)(:), [j * a, j * a + a - 1e-6])(1);
    
   nr_b(j + 1) = histc( A(:, :, 3)(:), [j * a, j * a + a - 1e-6])(1);
   
  endfor 
  
  % le adaug in solutie
  sol = [nr_r, nr_g, nr_b];
  
end
