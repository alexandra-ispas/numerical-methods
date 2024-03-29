function [X, y] = preprocess(path_to_dataset, histogram, count_bins)

  cale_pisici = strcat(path_to_dataset, 'cats/');
 
  cale_not_pisici = strcat(path_to_dataset, 'not_cats/');
  
  pisici_imgs = getImgNames(cale_pisici);
  
  not_pisici_imgs = getImgNames(cale_not_pisici);
  
  n1 = length(pisici_imgs);
  
  n2 = length(not_pisici_imgs);
  
  X = zeros( (n1 + n2), count_bins * 3);
  
  y = zeros(n1+n2, 1);
  %vectorul ia valoarea 1 pentru indicii corespunzatori pozelor cu pisici
  y(1 : n1, 1) = 1;
  %si -1 pentru cele fara pisici
  y( (n1 + 1) : (n1 + n2 ), 1 ) = -1;
 
  %pastrez adresa fiecarei poze
  poza1(1 : n1, :) = strcat(cale_pisici, pisici_imgs(1 : n1, :));
  poza2(1 : n2, :) = strcat(cale_not_pisici, not_pisici_imgs(1 : n2, : ));
  
  if histogram == 'RGB'
    %adaug mai intai caracterisiticile pozelor cu pisici
    for i = 1 : n1
      X(i, :) = rgbHistogram(poza1(i, :), count_bins);
    endfor

    %apoi catacterisiticle pozelor fara pisici
    for i = 1 : n2
      X(i + n1, : ) = rgbHistogram(poza2(i, :), count_bins);
    endfor
    
  else
    for i = 1 : n1
      X(i, :) = hsvHistogram(poza1(i, :), count_bins);
    endfor
    for i = 1 : n2
      X(i + n1, : ) = hsvHistogram(poza2(i, :), count_bins);
    endfor
  endif
  
endfunction
