function [C] = tproduct_fft (A, B)
  [l,p,n] = size(A);
  [p1,m,n1] = size(B);
  assert (p==p1 && n==n1, "Tensor dimensions do not match!");
  A1 = fft(A,[],3);
  B1 = fft(A,[],3);
  C1 = zeros(l,m,n);
  for i=1:n
    C1(:,:,i)=A1(:,:,i)*B1(:,:,i);
  endfor
  C = ifft(C1,[],3);
endfunction
