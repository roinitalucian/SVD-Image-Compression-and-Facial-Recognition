function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  A = double(rgb2gray(imread(image_path)));
  v = A(:);
  v = v - m;
  prTestImg = eigenfaces' * v;
  d = zeros(10, 1);
  for i = 1 : 10
    d(i) = norm(prTestImg - pr_img(:, i), 2);
  endfor
  min_dist = min(d);
  for i = 1 : 10
    if min_dist == d(i)
      output_img_index = i;
    endif
  endfor
endfunction
  