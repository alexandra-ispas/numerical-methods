function [A, b] = generate_probabilities_system(rows)
    nr_zeros = rows *(rows-1)/2;
    b = zeros(nr_zeros,1);
  
    b(nr_zeros+1 :nr_zeros+rows,1)  = 1;
    
    n = nr_zeros + rows;
    
    A = zeros(n);
    A(1,1) = 4;
    A(end,end) = 4;
    
    i = 2;
    k = 1;
    q = 3;
    while 1
        for j = 1:q
            A(i, i) = 5;
            i++;
        endfor
        if q > 2
            q--;
        endif
       
        for j = 1:k
            A(i,i) = 6;
            i++;
        endfor
        k++;
        
        if i >= nr_zeros+1
            break;
        endif
    endwhile
   
    A(nr_zeros+1, nr_zeros+1) = 4;
    A(nr_zeros+2 ,nr_zeros+1) = -1;
    A(nr_zeros-rows+2, nr_zeros+1) = -1;
    
    
    for i = nr_zeros+2 : n-1
        A(i,i) = 5; 
        A(i-rows,i) = -1;
        A(i-rows + 1,i) = -1;
        A(i+1,i) = -1;
        A(i-1,i) = -1;
    endfor
    
    A(2:3,1) = -1;
    A(1,2) = -1;
    A(3:5,2) = -1;
    
    k1 = 1;
    k2 = 1;
    i = 3;
    while 1

        if A(i,i) == 5
            A(i-k1-1,i) = -1;
            if A(i+1,i+1) ~= 6
                A(i-1,i) = -1;
            else
                %altfel, pun deasupra
                A(i+1,i) = -1;
                k1++;
            endif
            A(i+k1+1:i+k1+2,i) = -1;
      
        endif
   
        if A(i, i) == 6
            A(i+1, i) = -1;
            A(i-1, i) = -1;
            A(i-k2-2:i-k2-1, i) = -1;
            A(i+k2+2:i+k2+3,i) = -1;
            
            if A(i+1,i+1) == 5
                k2++;
            endif
            
        endif
        
        %valorilor de 0 din b
        if i >= nr_zeros+1 
            break;
        endif
        i++;
    endwhile
  
    A(end-1, end) = -1;
    A(end-rows, end) = -1;
    
endfunction
