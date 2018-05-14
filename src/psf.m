function v = psf(sigma,x,y)
% returns the value of the point spread function
% We're using a Gaussian PSF (truncated far away from
% its center -- the origin).

if x >= -8 && x <= 8 && y >= -8 && y <= 8
   v = exp(-sigma*(x.^2+y.^2));
else
   v = 0;
end;
