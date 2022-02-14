function [H, S, V] = RGB2HSV(R, G, B)
  
  r_p = double(R ./ 255);
  g_p = double(G ./ 255);
  b_p = double(B ./ 255) ;
  
  c_max = max(max(r_p, g_p), b_p);
  c_min = min(min(r_p, g_p), b_p);
  
  d = c_max - c_min;
  
  [m n] = size(r_p);
  H = zeros(m,n);
  S = zeros(m,n);
  
  H(c_max == r_p & d ~= 0) = 60 * mod( double( ( g_p(c_max == r_p & d ~= 0) - b_p(c_max == r_p & d ~= 0)) ./d(c_max == r_p & d ~= 0) ), 6);
  H(c_max == g_p & d ~= 0) = 60*(double( (b_p(c_max == g_p & d ~= 0) - r_p(c_max == g_p & d ~= 0)) ./ d(c_max == g_p & d ~= 0) ) + 2);
  H(c_max == b_p & d ~= 0) = 60 * (double(  (r_p(c_max == b_p & d ~= 0) - g_p(c_max == b_p & d ~= 0)) ./ d(c_max == b_p & d ~= 0)) + 4);
  S(c_max ~= 0) = double( d(c_max ~= 0) ./ c_max(c_max ~= 0));
  
  H = double( H ./ 360 );
  V = c_max;
  
 end
  
