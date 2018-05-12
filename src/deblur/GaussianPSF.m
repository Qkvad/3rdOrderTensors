function Z = GaussianPSF(sigma,x)
% Returns the n by n graph of the point spread function
% if x = 0 the mesh plot is generated, 
% otherwise, it is not graphed.
% sigma determines how much the light is spread.

[X,Y] = meshgrid(-8:8,-8:8);
Z = exp(-sigma*(X.^2+Y.^2));

if x == 0, mesh(-8:8,-8:8,Z); end;