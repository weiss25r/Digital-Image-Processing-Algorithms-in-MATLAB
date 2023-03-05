function out=conv3k(img,ker)
    % kernel matrice -> vettore (per riga)
    ker = rot90(ker, 2);
    [hk, wk] = size(ker);

    k2=ker;
    k2=k2(:)';
    ker=(0:255)'*k2;

    tmp=ones(size(img),'single');
    tmp=padarray(tmp,[hk-1 wk-1],0,'both');
    img=padarray(img,[hk-1 wk-1],0,'both');
    
    out=tmp;
    h=size(img,1);

    lut=[-h-1, -h, -h+1, -1, 0, 1, h-1, h, h+1];

    for i=find(tmp)
        t=0;
        for k=1:9
            t=t+ker(img(lut(k)+i)+1,k);
        end
        out(i)=t;
    end

    out=out(2:end-1,2:end-1);  