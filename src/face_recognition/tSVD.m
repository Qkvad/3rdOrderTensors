function [U,S,V] = tSVD (A)
  [l,m,n] = size(A);
  
  %l
  %m
  %n
  A1 = fft(A,[],3);
  
  U1 = zeros(l,l,n);
  S1 = zeros(l,m,n);
  V1 = zeros(m,m,n);
  
  for i=1:n
    [U1(:,:,i),S1(:,:,i),V1(:,:,(mod(n+1-i,n)+1))] = svd(A1(:,:,i));
  end
  
  U = ifft(U1,[],3);
  S = ifft(S1,[],3);
  V = ifft(V1,[],3);
  
endfunction
