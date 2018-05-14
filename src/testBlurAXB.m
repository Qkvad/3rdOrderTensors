function [A,B] = testBlurAXB(impath,sigma)
  % load image and convert it to grayscale
  img = imread(impath);
  img = rgb2gray(img);
  [m,n] = size(img); 
  % show image
  figure(1);
  imshow(img);
  pause(1);
  
  % twist image to m x 1 x n shape
  X = twist(img);
  
  % toeplitz matrices parameters
  bln = n;
  zro = n/2;
  %sigma=2.0;
  
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
  
  % apply blur to image
  B = tproduct(A,X);
  
  % squeeze it for show, convert to grayscale
  imgB = round(squeeze(B));
  imgB = mat2gray(imgB,[0 255]);
  % show blurred image
  pause(1);
  figure(2);
  imshow(imgB);
  
  
  
  