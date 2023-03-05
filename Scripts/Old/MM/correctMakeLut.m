function lut = correctMakeLut(se, h)
    %weiss25r - 13/11/2022 --

    [hk, wk] = size(se);
    k = 1;
    lut = zeros(1, numel(find(se ~= 0)));
    
    if(hk ~= 1 && wk ~= 1)
        t = -floor(hk/2);
        p = -floor(wk/2);
    
        for i = 1:hk
            for j = 1:wk
                if(se(i, j)~=0)
                    lut(k) = t*h + p;
                    k = k + 1;
                end
                p = p + 1;

            end
            
            p = -floor(wk/2);
            t = t + 1;
        end
    elseif(hk == 1)
        p = -floor(wk/2);

        for i = 1:hk*wk
            if(se(i)~=0)
                lut(i) = p*h;
            end
            p = p+1;

        end
    else
        t = -floor(hk/2);

        for i = 1:hk*wk
            if(se(i)~=0)
                lut(i) = t;
            end
            t = t+1;

        end
    
    end

    
  
end