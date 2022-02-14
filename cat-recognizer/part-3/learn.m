function [w] = learn(X, y)
  %pastrez dimensiunile lui X
  [m n] = size(X);
  %aplic transformarea Householder unei matrici formate din X si o coloana de 1
  [Q, R] = Householder([X, ones(m)(1:m, 1)]);
  %rezolv sistemul superior triunghiular
  w = SST(R, (Q' * y));
end
