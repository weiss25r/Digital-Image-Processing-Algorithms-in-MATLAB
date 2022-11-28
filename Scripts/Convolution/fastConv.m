function out=fastConv(img,ker)
    %weiss25r -- 13/17/2022 -- 

    % kernel matrice -> vettore (per riga)
    % PRE PROCESSING
    ker = rot90(ker, 2);
    h=size(img,1);

    [hk, wk] = size(ker);
    bx = floor(hk/2);
    by = floor(wk/2);

    k2=ker;
    k2=k2(:)';
    glut=(0:255)'*k2;

    tmp=ones(size(img));
    tmp=padarray(tmp,[bx by],0,'both');
    img=padarray(img,[bx by],0,'both');
    
    out=tmp;
    
    lut = fastestLut(ker, size(img, 1));

    for i=find(tmp)
        t=0;
        for k=1:hk*wk
            t=t+glut(img(lut(k)+i)+1,k);
        end
        out(i)=t;
    end
    
    out = out(bx+1:end-bx, by+1: end-by);
end