function [fld]=foldn(M,n)
  %folds blocks of block-column M onto 3rd dimension to create tensor
  [l_n,m] = size(M);
  l = round(l_n/n);
  for k=1:n
    fld(:,:,k) = M((k-1)*l+1:k*l,:);
  end
end
  