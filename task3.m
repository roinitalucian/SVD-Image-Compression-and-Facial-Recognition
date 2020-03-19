function [A_k S] = task3(image, k)
  A = double(imread(image));
  [m n] = size(A);
  miu = (mean(A'))';
  A = A - repmat(miu, 1, n);
  Z = A' / sqrt(n - 1);
  [U S V] = svd(Z);
  W = [];
  V = V';
  for i = 1:k
    W = [W; V(i, :)];
  endfor
  W = W';
  Y = W' * A;
  A_k = W * Y + miu;
    
endfunction