function out = naiveConv2(img, ker)
    %versione ker pari m*n, m = 2a+1, n = 2b+1
    [h, w] = size(img);

    img = single(img);

    %padding iniziale
    [hk, wk] = size(ker);

    out = padarray(img, [hk-1, wk-1], "both");


    %convoluzione
    a = floor((hk-1)/2);
    b = floor((wk-1)/2);

    for i = a+1: h-a
        for j = b+1: w-b
            k = 0;

            for s = -a:a
                for t = -b:b
                    k = k + ker(a+s+1, b+t+1)*img(i-s,j-t);
                end
            end

            out(i, j) = k;
        end
    end

    %out = out(hk-1:end-hk, wk-1:end-wk);
end