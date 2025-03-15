function out = decStandard(img)
    %img in scala di grigio e di dimensione pari a potenze di 2, SINGLE
    [h, w] = size(img);
    rowDec = zeros(size(img));
    out = zeros(size(img));

    l = size(img, 2);
    %haar prima per righe
    img_prev = img;

    while l > 1
        for i = 1:h
            [lpass, hpass] = haar(img_prev(i, 1:l));
    
            rowDec(i, 1:l/2) = lpass;
            rowDec(i, (l/2)+1:l) = hpass;

        end
        img_prev = rowDec;
        l = l/2;
    end

    l = size(img, 1);

    while l > 1
        for j = 1:w
            [lpass, hpass] = haar(img_prev(1:l, j)');
    
            out(1:l/2, j) = lpass;
            out((l/2)+1:l, j) = hpass;
        end
        img_prev = out;

        l = l/2;
    end



end