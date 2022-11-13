function output=dithering(img)
    img = single(img);
    map = round(0:255/15:255);
    map = map(floor((0:255)/16)+1);
    output1 = map(img + 1);
    figure; imshow(output1,[]); title('immagine quantizzata');

    output = output1;
    
    [H, W] = size(img);
    
    for h=1:H
        for w=1:W
            e = img(h,w)-output(h,w);
            if w < W 
                output(h,w+1) = output(h,w+1) + (e * 7/16);
            end
    
            if h < H
                output(h+1,w) = output(h+1,w) + (e * 5/16);
            end
    
            if h<H && w>1
                output(h+1,w-1) = output(h+1,w-1) + (e * 3/16);
            end
    
            if h<H && w<W
                output(h+1,w+1) = output(h+1,w+1) + (e * 1/16);
            end
        end
    
    end

    figure; imshow(output,[]); title('dithering applicato');


end
