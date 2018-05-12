function n = inner_product(x,y)
sz = size(x,1);
n = 0;
for i = 1:sz
   n = n + x(i,:) * y(i,:)' ;
end;
