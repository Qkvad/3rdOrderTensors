function [fld]=fold3(M)
  [l_n,m] = size(M);
  % this is meant for images, so n==3
  l = l_n/3;
  for k=1:3
    fld(:,:,k) = M((k-1)*l+1:k*l,:);
  end
end
  