function out = fastConv(img, ker)
    ker = rot90(ker, 2);
    
    img = single(img);
    prods = (0:255)'*ker(:)';
    [hk, wk] = size(ker);

    n = numel(ker);
    out = padarray(img, [hk-1, wk-1], 0, 'both');
    lut = vecMakeLut(ker, size(out, 1));

    for i = find(out)
        t = 0;

        for k = 1:n
            t = t + prods(out(i+lut(k))+1, k);
        end

        out(i) = t;
    end


    



end