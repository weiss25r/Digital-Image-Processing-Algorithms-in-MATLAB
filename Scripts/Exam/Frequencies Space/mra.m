function out = mra(img, level)
    %img in scala di grigio single quadrata di lato potenza di 2
    [h, w] = size(img);
    out = zeros(size(img));

    l = size(img, 1);

    img_prev = img;

    while l > level
        %haar su tutte le righe
        for i = 1:h
            [lpass, hpass] = haar(img_prev(i, 1:l));
    
            out(i, 1:l/2) = lpass;
            out(i, (l/2)+1:l) = hpass;
        end

        img_prev = out;

        for j = 1:w
            [lpass, hpass] = haar(img_prev(1:l, j)');
    
            out(1:l/2, j) = lpass;
            out((l/2)+1:l, j) = hpass;
        end

        img_prev = out;

        l = l/2;
    end


end