function lut = computeLut2(hk, wk, h)
    %funziona solo se hk=wk = dispari
    k = 1;
    lut = zeros(1, hk*wk);
    hk = floor(hk/2);
    wk = floor(wk/2);

    for i = -hk:hk
        for j = -wk:wk
            lut(k) = i*h + j;
            k = k + 1;
        end
    end
  
end