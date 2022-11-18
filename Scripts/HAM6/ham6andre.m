function out = ham6(img)
    img4096 = round(img/17)*17;                                             %Trasforma l'immagina RGB in 4096 colori

    [ind16,map16] = rgb2ind(img4096,16);                                    %'nodither'

    figure;imshow(ind16,map16);title('ind16 = quantized + dithering');

    out = zeros(size(img,1),size(img,2),'uint8');
    out(1,1) = ind16(1,1);
    [h,w,z] = size(img);

    x = ind16(1,1);
    lastpix = [map16(x+1,1) map16(x+1,2) map16(x+1,3)];
    y = 2;

    for i = 1:h
        for j = y:w
            x = ind16(i,j);
            d = sqrt(double((img4096(i,j,1)) - map16(x+1,1)).^2 + ...
                     double((img4096(i,j,2)) - map16(x+1,2)).^2 + ...
                     double((img4096(i,j,3)) - map16(x+1,3)).^2);

            rd = sqrt((map16(x+1,2) - lastpix(2)).^2 + (map16(x+1,3) - lastpix(3)).^2);
            gd = sqrt((map16(x+1,1) - lastpix(1)).^2 + (map16(x+1,3) - lastpix(3)).^2);
            bd = sqrt((map16(x+1,1) - lastpix(1)).^2 + (map16(x+1,2) - lastpix(2)).^2);

            err = min([d rd gd bd]);

            switch(err)
                case 1
                    out(i,j) = ind16(i,j);
                    lastpix = [map16(x+1,1) map16(x+1,2) map16(x+1,3)];
                case 2
                    out(i,j) = 16 + rgb4096(i,j,1);
                    lastpix = [rgb4096(i,j,1), lastpix(2), lastpix(3)];
                case 3
                    out(i,j) = 32 + rgb4096(i,j,2);
                    lastpix = [lastpix(1), rgb4096(i,j,2), lastpix(3)];
                case 4
                    out(i,j) = 48 + rgb4096(i,j,3);
                    lastpix = [lastpix(1), lastpix(2), rgb4096(i,j,3)];
            end

            lastpix=[map16(x+1,1), map16(x+1,2), map16(x+1,3)];
        end
        y = 1;
    end

end