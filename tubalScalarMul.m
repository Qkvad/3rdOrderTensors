function [C] = tubalScalarMul (A, B)
  assert(size(A)==size(B), "Tubal-scalar dimensions do not match!");
  n = size(A,3);
  C = zeros(1,1,n);
  for i=1:n
    for j=1:n
      C(mod(i+j-2,n)+1) += A(i) * B(j);
    endfor
  endfor
endfunction
