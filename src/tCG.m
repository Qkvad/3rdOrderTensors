function [X,P,R]=tCG(A,B)
  [lA,mA,nA]=size(A);
  if lA==mA
    X=ones(1,1,nA);
    [R,a]=normalize(B);
    P=R;
    for i=1:10
      c=tproduct(tinv(tproduct(tproduct(transp(P),A),P)),tproduct(transp(R),R));
      X=X+tproduct(P,c);
      showTimg(X);
      Rold=tproduct(transp(R),R);
      R=R-tproduct(A,tproduct(P,c));
      d=tproduct(tinv(Rold),tproduct(transp(R),R));
      P=R+tproduct(P,d);      
    end
  else
    sprintf('Dimensions dont match. \nExpected for arg1: mxmxn \n Expected for arg2: mx1xn');      
  end
  X=tproduct(X,a);
end