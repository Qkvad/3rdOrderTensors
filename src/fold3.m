function [fld]=fold3(M)
  [l_n,m] = size(M);
  % this is meant for images, so n==3
  l = l_n/3;
  % fld=zeros(l,m,3)
  for k=1:3
    fld(:,:,k) = M(1:l,:);
  end
end
  