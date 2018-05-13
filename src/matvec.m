function [tvec]=matvec(T)
  %returns vector of matrices along third dim of tensor
  [l,m,n]=size(T);
  for k=1:n
    tvec( (k-1)*l+1 : k*l, 1:m )=T(:,:,k);
  end
end