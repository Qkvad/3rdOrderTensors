function B=transp(A)
  [l,m,n]=size(A);
  B=zeros(m,l,n);
  B(:,:,1)=A(:,:,1)';
  i=n; j=2;
  while i~=1
    B(:,:,j)=A(:,:,i)';
    j=j+1; i=i-1;    
  end
end