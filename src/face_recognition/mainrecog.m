% r is the dimension of subspace where faces will be projected
% r should be an integer smaller than 7
function [p] = mainrecog (r)
  addpath(genpath(".."));
  tensors = cell(40);
  
  % Reading images from .pgm files
  for i=1:40
    for j=1:10
      originalimg = imread(strcat("orl_faces/s", num2str(i), "/", num2str(j), ".pgm"));
      tensors{i}(:,j,:) = double(originalimg);
    end
  end
  
  % Dividing into training and test set.
  test = zeros(40,10); %zero for training set, one for test set
  for i=1:40
    rs = randsample(10,3);
    for j=1:3
      test(i,j) = 1;
    end
  end
  training = cell(40);
  for i=1:40
    k = 1;
    for j=1:10
      if test(i,j) == 0
        training{i}(:,k,:) = tensors{i}(:,j,:); 
        k += 1;
      end
    end
  end
  
  % SVD decompositions
  U = cell(40);
  for i=1:40
    [U{i},S,V] = tSVD(training{i});
  end
  
  % guessing the person
  attempts = 0;
  correct = 0;
  for i=1:40
    i
    fflush(stdout);
    for j=1:10
      if test(i,j) == 1
        minerror = Fnorm(tensors{i}(:,j,:), 'fro');
        mink = 1;
        for k=1:40
          error = Fnorm(tproduct_fft(tproduct_fft(U{k}(:,1:r,:),
            transp(U{k}(:,1:r,:))),training{i}(:,j,:))-training{i}(:,j,:), 'fro');
          if error < minerror
            minerror = error;
            mink = k;
          end
        end
        if mink==i
          correct += 1;
        end
        attempts += 1;
      end
    end
  end
  
  attempts
  correct
  
  p = correct/attempts;
end
