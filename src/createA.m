function A = createA(n,sigma)
  % Works well for 32X32 and 64X64 images with sigma=2.0
  bln = n;
  zro = n/2;
  % compute toeplitz matrices with gaussian psf, stack them into tensor
  max=0; maxi=0;
  for i = -bln/2:bln/2-1
   for k = 1:bln
      c(k) = psf(sigma, i, k-1);
      r(k) = psf(sigma, i, 1-k);
   end
   A(:,:,bln/2+i+1) = toeplitz(c,r);
   tpln = norm(A(:,:,bln/2+i+1));
   if tpln > max
     max = tpln;
     maxi = bln/2+i+1;
   end
  end 
  % fix some of the important frontal slices
  % put maximal toeplitz matrix on first frontal slice
  A(:,:,1) = eye(bln,bln) + A(:,:,maxi);  
  % set to zero "irrelevant" slices
  for i=zro+1:n
    A(:,:,i) = zeros(bln,bln);
  end
end