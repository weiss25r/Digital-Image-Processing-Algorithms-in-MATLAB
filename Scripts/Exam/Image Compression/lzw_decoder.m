function out = lzw_decoder(sign, dict, size)
    codes = dict(sign);

    h = size(1);
    w = size(2);

    out = zeros(h, w, 'uint8');
    t = 1;

    i = 1;
    j = 1;

    for code = codes
        n = numel(code.seq);
        t = 1;
        while t <= n
            out(i, j) = code.seq(t);
            
            t = t + 1;
            j = j + 1;

            if(j > w)
                i = i + 1; 
                j = 1;
            end
        end
    end
end