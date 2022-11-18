function out = erosion(img, se)
    %img in scala di grigio.
    [w, h] = size(img);
    wk = floor(size(se, 1)/2);
    hk = floor(size(se, 2)/2);

    out = zeros(size(img));

    for i = wk+1 : w-wk
        for j = hk+1: h-hk
            t = NaN;

            for x = -wk:wk
                for y = -hk:hk
                    t = min(t, img(i+x, j+y));
                end
            end

            out(i, j) = t;
        end
    end
end