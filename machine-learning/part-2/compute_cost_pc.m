function [cost] = compute_cost_pc(points, centroids)
  [NC, x] = size(centroids);
  [m n] = size(points);
  cost = 0;
  
  for i = 1 : m
     minim = inf;
     for j = 1 : NC
      dis = double( norm( points(i, :) -  centroids(j,:) ) );
       if dis < minim    
          minim = dis;
       endif   
      endfor
      cost = cost + minim; 
    endfor
endfunction

