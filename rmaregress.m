function [b,R2,p]=rmaregress(x,y)
x=x(:);y=y(:);

% Remove missing values, if any
wasnan = (isnan(y) | any(isnan(x),2));
havenans = any(wasnan);
if havenans
   y(wasnan) = [];
   x(wasnan,:) = [];
   %n = length(y);
end
X = [ones(size(y)),x];
[b1, ~,~,~,stats]=regress(y,X);

b=zeros(2,1);
b(2)=b1(2)/stats(1)^0.5;% slope
b(1)=mean(y)-mean(x)*b(2);%interception

R2=stats(1);
p=stats(3);

end