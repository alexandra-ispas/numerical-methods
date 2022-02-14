function [Q R] = Householder(A, b)
    [m n] = size(A);
    Q = eye(m);

    for i = 1 : n
      % calculare reflector Householder
        v = zeros(m,1);
        sigma = sign( A(i, i)) * norm( A(i : m, i));
        v(i) = A(i,i) + sigma;
        v(i+1 : m) = A(i + 1 : m, i);
        
        %modificare H
        H = eye(m) - 2 * v * v' / (v' * v);
        %actualizare matrice
        A = H * A;
        Q = Q * H;
    endfor
    R = A;
endfunction
