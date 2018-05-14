function tpi = tinv(T)
  [l,m,n] = size(T);
  Tf = fft(T,[],3);
  for i=1:n
    tpf(:,:,i) = inv(Tf(:,:,i));
  end
  tpi = ifft(tpf,[],3);
end