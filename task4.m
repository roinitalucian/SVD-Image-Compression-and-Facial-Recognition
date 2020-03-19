function [A_k S] = task4(image, k)
  A = double(imread(image));
  [m n] = size(A);
  
  for i = 1 : m
    miu(i) = mean(A(i, :));
    A(i, :) = A(i, :) - miu(i);
  endfor
  
  Z = (A * A') ./ (n - 1);
  [V S] = eig(Z);
  V = fliplr(V);  
 
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = W * Y + miu';
endfunction
