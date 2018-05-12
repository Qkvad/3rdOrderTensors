function B = blur(A)
  B(:,:,1) = applyGaussianPSF(0.1, A(:,:,1), 1);
  B(:,:,2) = applyGaussianPSF(0.1, A(:,:,2), 1);
  B(:,:,3) = applyGaussianPSF(0.1, A(:,:,3), 1);

  x = max([max(max(max(B))),0.000001]);
  scaleB = (1/x)*B;
  figure(2); 
  image(scaleB);
  title('Blured image');
end;