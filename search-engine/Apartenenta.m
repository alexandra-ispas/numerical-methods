function y = Apartenenta(x, val1, val2)
	
  aux = double(val1 - val2);
  a = double( -1 / aux);
  b = double(val1 / aux);
 
    if x < val1 
      y = 0;
      
    elseif x >= val1 && x <= val2
      y = a * x + b;
   
    elseif x > val2 
      y = 1;
    endif
    
 endfunction