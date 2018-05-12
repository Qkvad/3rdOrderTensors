function [g, error, niter, flag] = CGmethod(sigma, g, f, maxit, tol)
% Ag = f
% sigma...parameter for the Gaussian psf
% g...input, initial guess
%  ...output, approximate solution
% f...blurred image
%
% maxit...maximum number of iterations to attempt
% niter...number of iterations actually preformed
% error...difference between the exact answer and our answer
% tol...allowed error
% flag=1 if function returns before error <= tol

flag = 0;
niter = 0;

r = f - applyGaussianPSF(sigma,g,1); % r...residual
d = r; % Initial search direction
norm_f = sqrt(inner_product(f,f));
if(norm_f == 0.0), norm_f = 1.0; end;
error = sqrt(inner_product(r,r)) / norm_f;
for niter = 1:maxit
   if(error < tol), return, end; % bail out if the error is small enough
   % multiply our search direction by the blur matrix
   Ad = applyGaussianPSF(sigma,d,1);
   % the square of the blur matrix norm of d
   inp_Ad_d = inner_product(Ad,d);
   % Step size 
   alpha = inner_product(r,d) / inp_Ad_d;
   % improve g
   g = g + alpha * d;
   % update r
   r = f - applyGaussianPSF(sigma,g,1);
   % the conjugate factor to force our search directions
   % to be orthogonal (in some sense)
   beta = -inner_product(r,Ad) / inp_Ad_d;
   % New search direction
   d = r + beta * d;
   % measure the relative error
   error = sqrt(inner_product(r,r)) / norm_f;
end;
if(error > tol) flag = 1; end;

