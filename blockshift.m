function tvecnew=blockshift(tvec,l,m,n)
  [p,r]=size(tvec);
  tvecnew(1:l,1:m)=tvec(p-l+1:p,1:m);
  for i=1:n-1
    tvecnew( l*i+1 : (i+1)*l , 1:m)=tvec( (i-1)*l+1 : i*l,1:m );    
  end
end