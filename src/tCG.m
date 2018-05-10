function [X,P,R]=tCG(A,B)
  [lA,mA,nA]=size(A);
  if lA==mA
    X=ones(1,1,nA);
    [R,a]=normalize(B);
    P=R;
    for i=1:nA
      c=tproduct(multinv(tproduct(tproduct(transp(P),A),P)),tproduct(transp(R),R));
      X=X+tproduct(P,c);
      Rold=tproduct(transp(R),R);
      R=R-tproduct(A,tproduct(P,c));
      d=tproduct(multinv(Rold),tproduct(transp(R),R));
      P=R+tproduct(P,d);      
    end
  else
    sprintf('Dimensions dont match. \nExpected for arg1: mxmxn \n Expected for arg2: mx1xn');      
  end
  X=tproduct(X,a);
end