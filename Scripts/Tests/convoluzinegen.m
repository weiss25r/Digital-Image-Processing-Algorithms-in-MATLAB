function out=convoluzinegen(img,ker)

[hk,wk] = size(ker);
x = floor((wk/2));  
y = floor((hk/2));

k2=ker';
k2=k2(:)';
ker=(0:255)'*k2;

tmp=ones(size(img),'single');
tmp=padarray(tmp,[x y],0,'both');
img=padarray(img,[x y],0,'both');
out=tmp;

h = size(img,1);
dimk = wk*hk;
lut = zeros(dimk);

for(i=0:wk)
   for(j=0:hk)
	lut(i*hk+j+1)= (-x+i)*h+(-y+j);
   end
end

for i=find(tmp)
   t=0;
   for k=1:dimk
	t=t+ker(img(lut(k)+i)+1,k);
   end
   out(i)=t;
end

out=out(x+1:end-x,y+1:end-y);
figure;
title('collega convoluzione');
imshow(out, []);
end
