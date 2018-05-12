function maindeblur(maxiter)
  originalimg=imread('testimg2.jpeg');
  figure(1)
  image(originalimg);
  title('Original image')
  originalimg=double(originalimg);
  bluredimg=blur(originalimg);
  approximg=deblur(bluredimg,maxiter);
end