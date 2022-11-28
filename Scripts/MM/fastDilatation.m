function out=fastDilatation(img,se)
    %weiss25r -- 18/17/2022 -- 

    % kernel matrice -> vettore (per riga)
    % PRE PROCESSING
    [hk, wk] = size(se);
    bx = floor(hk/2);
    by = floor(wk/2);

    tmp=ones(size(img),'uint8');
    tmp=padarray(tmp,[bx by],0,'both');
    img=padarray(img,[bx by],0,'both');
    
    out=tmp;
    h=size(img,1);
    
    lut = fastestmmLut(se, h);

    for i=find(tmp)
        t=NaN;
        for k=1:numel(lut)
            t = max(t, img(i+lut(k)));
        end
        out(i)=t;
    end

    out=out(bx+1:end-bx, by+1:end-by);  
end