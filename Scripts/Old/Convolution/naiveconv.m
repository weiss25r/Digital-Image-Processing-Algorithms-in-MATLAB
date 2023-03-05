function out = naiveconv(img, ker)
    %img deve essere in scala di grigio e single
    [w, h] = size(img);
    wk = floor(size(ker, 1)/2);
    hk = floor(size(ker, 2)/2);

    out = zeros(size(img));

    for i = wk+1 : w-wk
        for j = hk+1: h-hk
            t = 0;

            for x = -wk:wk
                for y = -hk:hk
                    t = t + img(i-x, j-y)*ker(x+wk+1, y+hk+1);
                end
            end

            out(i, j) = t;
        end
    end
end