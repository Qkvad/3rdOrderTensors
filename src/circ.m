function [tcirc] = circ(T)
  %creates circular block-column matrix from tensors frontal slices as blocks
  [l,m,n] = size(T);  
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
