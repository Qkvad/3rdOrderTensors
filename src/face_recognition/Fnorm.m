function [fn] = Fnorm (A)
  [l,m,n] = size(A);
  
  fn = 0;
  for i=1:l
    for j=1:m
      for k=1:n
        fn += A(i,j,k);
      end
    end
  end
  
  fn /= l*m*n;
endfunction
