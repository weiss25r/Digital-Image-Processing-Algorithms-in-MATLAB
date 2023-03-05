function out = ham6(img)
    %img floating point 0 1
    img4096 = round(img/17)*17;
    out = zeros(size(img));
    
    [ind16, map16] = rgb2ind(img4096, 16, 'nodither');
    figure; imshow(ind16, map16); title('indexed');
    map16 = map16*255;
    img4096 = double(img4096);

    w = double(ind16(1, 1));
    lastpix = [map16(w+1, 1), map16(w+1, 2), map16(w+1, 3)];

    start = 2;

    for i = 1:size(img4096, 1)
        for j = start:size(img4096, 2)
            currpix = [map16(ind16(i, j)+1, 1), map16(ind16(i, j)+1, 2), map16(ind16(i, j)+1, 3)];
            
            d1 = sqrt( (img4096(i, j, 1)-currpix(1))^2 + (img4096(i, j, 2)-currpix(2))^2 + (img4096(i, j, 3)-currpix(3))^2);
            
            r = [img4096(i, j, 1), lastpix(2), lastpix(3)];
            g = [lastpix(1), img4096(i, j, 2), lastpix(3)];
            b = [lastpix(1), lastpix(2), img4096(i, j, 3)];
            
            
            er = sqrt((img4096(i, j, 1)-r(1))^2 + (img4096(i, j, 2)-r(2))^2 + (img4096(i, j, 3)-r(3))^2);
            eg = sqrt((img4096(i, j, 1)-g(1))^2 + (img4096(i, j, 2)-g(2))^2 + (img4096(i, j, 3)-g(3))^2);
            eb = sqrt((img4096(i, j, 1)-b(1))^2 + (img4096(i, j, 2)-b(2))^2 + (img4096(i, j, 3)-b(3))^2);
            
            minerr = min([d1, er, eg, eb]);

            switch minerr
                case d1
                    out(i, j, 1) = currpix(1);
                    out(i, j, 2) = currpix(2);
                    out(i, j, 3) = currpix(3);
                    lastpix = [map16(w+1, 1), map16(w+1, 2), map16(w+1, 3)];


                case er
                    out(i, j, 1) = r(1);
                    out(i, j, 2) = r(2);
                    out(i, j, 3) = r(3);

                case eg
                    out(i, j, 1) = g(1);
                    out(i, j, 2) = g(2);
                    out(i, j, 3) = g(3);

                case eb
                    out(i, j, 1) = b(1);
                    out(i, j, 2) = b(2);
                    out(i, j, 3) = b(3);

            end

            w = double(ind16(i, j));
            lastpix = [map16(w+1, 1), map16(w+1, 2), map16(w+1, 3)];
            
        end

        start = 1;
    end

    figure; imshow(out, [0 1]); title('ham6');

end