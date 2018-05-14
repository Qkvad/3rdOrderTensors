function testBlurAXB(impath,sigma)
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
  
  % crate tensor A with toeplitz blocks and gaussian point spread function
  A = createA(n,sigma);
  
  % apply blur to image
  B = tproduct(A,X);
  
  % show blurred image
  showTimg(B);
  
  % deblurr
  [X,P,R] = tCG(A,B);
  
  % show deblurred image
  showTimg(X);
  
  
  
  