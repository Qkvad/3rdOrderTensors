function g = applyGaussianPSF(sigma, f, x)
% Returns the blurred graph of f
% if x = 0 the mesh plot is generated,
% otherwise it is not graphed.
% sigma determines how much the light is spread
% (How bad the blur is.)

% Get size
[m n] = size(f);

% create Toeplitz blocks
for i = -8:8
   for k = 1:n
      c(k) = psf(sigma, i, k-1);
      r(k) = psf(sigma, i, 1-k);
   end;
   
   block(i+9,1:n,1:n) = toeplitz(c,r);
end;

% apply the convolution product row by row
for i = 1:m
   g(i,1:n) = zeros(1,n);

   % apply convolution product
   % to the graph on row i
   for j = -8:8
      if i-j >= 1 & i-j <= m
         b(:,:) = block(j+9,:,:);
         g(i,1:n) = g(i,1:n) + f(i-j,1:n) * b;
      end;
   end;
end;

if x == 0, mesh(g); end;