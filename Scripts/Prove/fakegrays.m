function [tav, out] = fakegrays(img)
    %img 24bpp
    %raffaele terracino con licensa studiata in open data 2 settimane fa
    tav = zeros(256*6, 3);
    out = zeros(size(img));

    g = meshgrid(1:256, 1:6);
    tav(:, 2) = g(:)-1;

    a = [0 1 2];

    for i = 1:6:256*6
        tav(i:i+2, 3) = a;
        tav(i+3:i+5, 3) = a;
        a = a + 1; 
    end


    r = meshgrid(1:256, 1:6);

    tav(4:end, 1) = r(1:end-3);
    
    tav = uint8(tav);

    [h, w, ~] = size(img);

    for i = 1:h
        for j = 1:w
            gray = single(img(i, j, :));
            index = floor(gray(1)*0.212671 + 0.715160*gray(2) + 0.072169*gray(3));
            out(i, j, :) = tav((index+1)*6, :);
        end
    end
    
    out = uint8(out);
    figure; imshow(out, []);
end