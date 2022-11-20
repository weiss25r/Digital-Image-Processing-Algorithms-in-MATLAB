function out=medianFilter(img,ker)
    %weiss25r -- 13/17/2022 -- 

    % kernel matrice -> vettore (per riga)
    % PRE PROCESSING
    ker = rot90(ker, 2);
    [hk, wk] = size(ker);
    bx = floor(hk/2);
    by = floor(wk/2);

    tmp=ones(size(img),'single');
    tmp=padarray(tmp,[bx by],0,'both');
    img=padarray(img,[bx by],0,'both');
    
    out=tmp;
    h=size(img,1);
    
    lut = computeLut(hk, wk, h);
    aus = find(tmp);

    for i=1:numel(aus)
        out(aus(i))=median(img(lut+aus(i)));
    end

    out=out(hk-bx:end-bx,hk-by:end-by);  
end