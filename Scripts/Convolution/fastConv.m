function out=fastConv(img,ker)
    % kernel matrice -> vettore (per riga)
    % PRE PROCESSING
    ker = rot90(ker, 2);
    [hk, wk] = size(ker);
    bx = floor(hk/2);
    by = floor(wk/2);

    k2=ker;
    k2=k2(:)';
    ker=(0:255)'*k2;

    tmp=ones(size(img),'single');
    tmp=padarray(tmp,[bx by],0,'both');
    img=padarray(img,[bx by],0,'both');
    
    out=tmp;
    h=size(img,1);
    
    lut = computeLut(hk, wk, h);

    for i=find(tmp)
        t=0;
        for k=1:hk*wk
            t=t+ker(img(lut(k)+i)+1,k);
        end
        out(i)=t;
    end

    out=out(hk-bx:end-bx,hk-by:end-by);  