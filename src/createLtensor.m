function [largeT] = createLtensor(l,m,n)
  for k=1:n
    largeT(:,:,k) = rand(l,m);
  end
end