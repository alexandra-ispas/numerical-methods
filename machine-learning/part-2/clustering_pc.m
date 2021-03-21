function [centroids] = clustering_pc(points, NC)
  [m n] = size(points);
  
  x = m / NC;
  
  cluster = zeros(NC, x);
  
  centroids = zeros(NC, n);
  
  for i = 1 : NC
    
      for j = 0 : x-1;
          cluster(i, j + 1) = i + j * NC;
      endfor  
      
      for j = 1 : n 
        centroids(i, j) = double( mean( points (cluster(i, :), j ) ) );
      endfor
      
  endfor
  
  prev = centroids;
  
  while 1
    
      grup = zeros(NC, 1);
      
      poz(1 : NC) = 1;
      
      for i = 1 : m
      
          minim = inf;
          
          for j = 1 : NC
            
              dis = double( norm( points(i, :) -  centroids(j,:) ) );
          
              if dis < minim
                  minim = dis;
                  x = j;
              endif
            
           endfor
           grup( x, poz(x) ) = i ;
           poz(x)++;
           
      endfor
      for i = 1 : NC
          for j = 1 : n
           
             centroids(i, j) = double(mean(points( grup(i,1 : poz(i)-1 ), j)));
          endfor
      endfor
      
      if prev == centroids
          return;
      endif
      
      prev = centroids;
      
    endwhile
    
endfunction