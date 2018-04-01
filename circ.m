function [tcirc] = circ(T,method)
  [l,m,n] = size(T);
  
  if method==-1
    method = round(rand*2);
  end
  
  timestart = cputime;
  if method==0
    printf("Petrina metoda...\n");
    tvec=matvec(T);
    tcirc=tvec;
    for i=1:n-1
      tvec=blockshift(tvec,l,m,n);
      tcirc=[tcirc,tvec];
    end
  else
    printf("Sandrova metoda...\n");
    for k=1:n
      for col=1:n
        shift    = (col-1)*l;
        rowstart = (k-1)*l+1 + shift;
        if rowstart > n*l
          rowstart -= n*l;
        end
        rowend   = rowstart+l-1;
        tcirc( rowstart : rowend , (col-1)*m+1 : col*m) = T(:,:,k);     
      end
    end
  end
  time = cputime -timestart
  
end