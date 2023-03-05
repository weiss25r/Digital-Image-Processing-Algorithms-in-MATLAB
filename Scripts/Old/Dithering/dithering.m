function output=dithering(img)
    img = single(img);
    map = round(0:255/15:255);
    map = map(floor((0:255)/16)+1);
    output1 = map(img + 1);
    figure; imshow(output1,[]); title('immagine quantizzata');

    output = output1;
    
    [H, W] = size(img);
    
    for i=1:H
        for j=1:W
            
            e = abs(img(i,j)-output(i,j));

            if j < W 
                output(i,j+1) = output(i,j+1) + (e * 7/16);
            end
    
            if i < H
                output(i+1,j) = output(i+1,j) + (e * 5/16);
            end
    
            if i<H && j>1
                output(i+1,j-1) = output(i+1,j-1) + (e * 3/16);
            end
    
            if i<H && j<W
                output(i+1,j+1) = output(i+1,j+1) + (e * 1/16);
            end
        end
    
    end

    figure; imshow(output,[]); title('dithering applicato');


end
