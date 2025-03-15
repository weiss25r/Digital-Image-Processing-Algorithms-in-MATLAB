function out = biresize(img, scale)
    [h, w] = size(img);
    out = zeros(h*scale, w*scale, 'single');

    resH = h*scale/2;
    resW = w*scale/2;


    for i = -resH:resH-1
        for j = -resW: resW-1
            pix = [i+resH+1, j+resW+1];
            ipix = ([i, j]/scale) + [h/2, w/2]+1;
            ipix = floor(ipix);

            a = [max(ipix(1)-1, 1), max(ipix(2)-1, 1)];
            b = [max(ipix(1)-1, 1), min(ipix(2)+1, w)];
            c = [min(ipix(1)+1, h), max(ipix(2)-1, 1)];
            d = [min(ipix(1)+1, h), min(ipix(2)+1, w)];

            %pesi

            di = single(a(2))-single(ipix(2));
            dj = single(a(1))-single(ipix(1));

            grays = single([img(a(1), a(2)), img(b(1), b(2)), img(c(1), c(2)), img(d(1), d(2))]);

            out(pix(1), pix(2)) = grays(1) + di*(grays(2)-grays(1))+dj*(grays(3)-grays(1))+di*dj*(grays(1) - grays(2)-grays(3)+grays(4));
        end
        
    end

    out = uint8(out);

end