function [sqz]=squeeze(T)
  sqz(:,:) = T(:,1,:);
end