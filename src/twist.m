function [twst]=twist(M)
  % implemented to twist all frontal slices if M is third-order tensor
  [f,s] = size(size(M));
  if s==2 % normal matrix twist
    twst(:,1,:) = M(:,:);
  else % tensor twist
    [l,m,n] = size(M);
    for i=1:n
      twst(:,i,:) = M(:,:,i);
    end
  end  
end