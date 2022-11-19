function out=fastDilatation(img,ker)
    %weiss25r -- 18/17/2022 -- 

    % kernel matrice -> vettore (per riga)
    % PRE PROCESSING
    [hk, wk] = size(ker);
    bx = floor(hk/2);
    by = floor(wk/2);

    tmp=ones(size(img),'single');
    tmp=padarray(tmp,[bx by],0,'both');
    img=padarray(img,[bx by],0,'both');
    
    out=tmp;
    h=size(img,1);
    
    lut = computeLut(hk, wk, h);

    for i=find(tmp)
        t=NaN;
        for k=1:hk*wk
            t = max(t, img(i+lut(k)));
        end
        out(i)=t;
    end

    out=out(bx:end-bx-1, by:end-by-1);  
end