function [tensors] = mainrecog ()
  tensors = cell(40);
  for i=1:40
    for j=1:10
      originalimg = imread(strcat("orl_faces/s", num2str(i), "/", num2str(j), ".pgm"));
      tensors{i}(:,:,j) = double(originalimg);
    end
  end
  originalimg = imread("orl_faces/s1/1.pgm");
  figure(1);
  image(originalimg);
end
