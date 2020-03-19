function task2()
  
  for u = 1 : 4
    figure(num2str(u));
    tit = strcat("Imaginea ", num2str(u));
    title (tit);
    path = strcat("in/images/image",num2str(u),".gif");
    A = double(imread(path));
    [U S V] = svd(A);
    [m n] = size(A);
    
    k = [1:19 20:20:99 100:30:min(m,n)];
    f = zeros(length(k), 1);
    subplot(2, 2, 1);
    plot(diag(S));    
    
    for j = 1 : length(k)      
      sUp = 0;
      sDown = 0;    
      for i = 1 : k(j)
        sUp = sUp + S(i, i);
      endfor   
      for i =  1 : min(m, n) 
        sDown = sDown + S(i, i);
      endfor    
     f(j) = sUp / sDown;
   endfor
    subplot(2, 2, 2); 
    plot(k, f);   
     
    for v = 1 : length(k)
      sum1 = 0;  
      A_k = task1(path, k(v));       
      for i = 1 : m
        for j = 1 : n
          sum1 = sum1 + power(A(i, j) - A_k(i, j),2);
        endfor
      endfor   
      f(v) = sum1 / (m * n);
    endfor 
    subplot(2, 2, 3);
    plot(k, f);
      
    f = (m * k + n * k + k) / (m * n);
    subplot(2, 2, 4);
    plot(k, f);
  endfor
endfunction
