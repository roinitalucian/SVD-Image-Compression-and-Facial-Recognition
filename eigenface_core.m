function [m A eigenfaces pr_img] = eigenface_core(database_path)
  T = [];
  for i = 1 : 10
    path = strcat(database_path, "/", num2str(i), ".jpg");
    A = double(rgb2gray(imread(path)));
    T = [T A(:)];
  endfor
  [m n] = size(T);
  miu = zeros(m, 1);
  for i = 1 : m
    miu(i) = mean(T(i, :));
  endfor
  
  for i = 1 : m
    T(i, :) = T(i, :) - miu(i);
  endfor
  m = miu;
  A = T;
  M = A' * A;
  [p q] = size(M);
  [V S] = eig(M);
  T = [];
  for i = 1 : p
    if S(i, i) > 1
      T = [T V(:, i)];
    endif
  endfor
  V = T;
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
endfunction
