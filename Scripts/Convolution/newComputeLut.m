function lut = newComputeLut(hk, wk, h)
    %weiss25r - 13/11/2022 --
    k = 1;
    lut = zeros(1, hk*wk);
    
    if(hk ~= 1 && wk ~= 1)
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
    elseif(hk == 1)
        p = -floor(wk/2);

        for i = 1:hk*wk
            lut(k) = p*h;
            p = p+1;
        end
    else
        t = -floor(wk/2);

        for i = 1:hk*wk
            lut(k) = t;
            t = t+1;
        end
    
    end

    
  
end