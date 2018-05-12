function A = deblur(B, n)
  % initial guess
  A = zeros(size(B));
  %n=maxiter
  [A(:,:,1), error, niter, flag] = CGmethod(0.1, A(:,:,1), B(:,:,1), n, 0);
  [A(:,:,2), error, niter, flag] = CGmethod(0.1, A(:,:,2), B(:,:,2), n, 0);
  [A(:,:,3), error, niter, flag] = CGmethod(0.1, A(:,:,3), B(:,:,3), n, 0);
   
  x = max([max(max(max(A))),0.000001]);
  scaleA = (1/x)*A;
  figure(3); 
  image(scaleA);
  title('Deblurred image');
end;