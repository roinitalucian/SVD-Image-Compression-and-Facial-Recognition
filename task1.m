function A_k = task1(image, k)
  A = double(imread(image));
  [U S V] = svd(A);
  U = transpose(U);
  U_k = [];
  for i = 1:k
    U_k = [U_k; U(i, :)];
  endfor
  U_k = transpose(U_k);
  S_k = [];
  for i = 1:k
    S_k = [S_k; S(i, 1:k)];
  endfor
  V = transpose(V);
  V_kt = [];
  for i = 1:k
    V_kt = [V_kt; V(i, :)];
  endfor
  A_k = U_k * S_k * V_kt;
end