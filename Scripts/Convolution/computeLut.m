function lut = computeLut(hk, wk, h)
    k = 1;
    lut = zeros(1, hk*wk);
    t = -floor(hk/2);
    p = -floor(wk/2);

    for i = 1:hk
        for j = 1:wk
            lut(k) = t*h + p;
            k = k + 1;
            p = p + 1;
        end
        
        p = -floor(wk/2);
        t = t + 1;
    end
  
end