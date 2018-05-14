function testBlurAXB(impath,sigma)
  %sigma...blur parameter
  
  % load image and convert it to grayscale
  img = imread(impath);
  img = rgb2gray(img);
  [m,n] = size(img); 
  
  % twist image to m x 1 x n shape
  X = twist(img);
  
  % crate tensor A with toeplitz blocks and gaussian point spread function
  A = createA(n,sigma);
  
  % apply blur to image
  B = tproduct(A,X);
  imgB = squeeze(B);
  imgBB = mat2gray(imgB,[0 255]);
  
  % deblurr
  [X,P,R] = tCG(A,B);
  imgX = squeeze(X);
  imgXX = mat2gray(imgX,[0 255]);
  
  % create the subplots
  pause(1);
   figure;
   subplot(2,2,1); imshow(abs(img)); title('Original image');
   subplot(2,2,2); imshow(abs(imgBB)); title('Blured image');
   subplot(2,2,3); imshow(abs(imgXX)); title('Approximation by tCG');
   
   
   
   
  
end
  
  