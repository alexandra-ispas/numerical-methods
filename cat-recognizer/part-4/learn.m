function [w] = learn(X, y, lr, epochs)
  [m,n] = size(X);
  X(:, 1 : n) = double( ( X(:, 1 : n) .- mean(X(:, 1 : n)) ) ./ std( X(:, 1 : n) ) );
  X(1 : m, n + 1) = 1;
  
  w(1 : n + 1, 1) = -0.1 + 0.2 * rand(n + 1, 1);
  
  for epoch = 1 : epochs
    k = randperm(m);
    X_batch = X(k(1 : 64), :);
    y_batch = y(k(1 : 64));
    w(1 : n + 1) = w(1 : n + 1) .- lr * double(1 / m) * (  X_batch(1 : 64, 1 : n + 1)' * ( X_batch(1 : 64, :) * w - y_batch(1 : 64) ) );

  endfor
  
endfunction


