function showTimg(X)
  imgX = squeeze(X);
  imgX = mat2gray(imgX,[0 255]);
  figure;
  imshow(imgX);