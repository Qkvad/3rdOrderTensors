function [V,a]=normalize(X)
  [l,m,n]=size(X);
  if m==1
    V=fft(X,[],3);
    for j=1:n
      a(1,1,j)=norm(V(:,1,j),2);
      if a(1,1,j)>1e-8
        V(:,1,j)=1/a(1,1,j) * V(:,1,j);        
      else
        V(:,1:j)=randn(n,1);
        a(1,1,j)=norm(V(:,1,j),2);
        V(:,1,j)=1/a(1,1,j) * V(:,1,j);
        a(1,1,j)=0;
      end
    end
  else
    sprintf('Dimensions dont match. \nExpected for arg1: lx1xn.')
  end
  V=ifft(V,[],3);
  a=ifft(a,[],3);
end