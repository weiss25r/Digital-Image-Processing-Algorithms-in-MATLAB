function out = dithering(img)
    %quantizzazione a 16 colori

    img = single(img);
    map = single(round(0:255/15:255));
    map = map(floor((0:255)/16)+1);
    quant = map(img);
    figure; imshow(quant, []); title('immagine quantizzata a 16 colori');
    
    out = quant;
    %floyd-steinberg dithering

    [h, w] = size(img);

    for i = 1:h
        for j = 1:w
            %calcolo l'errore
            err = img(i, j)-out(i, j);

            %diffondo l'errore ai pixel vicini
            if j > 1 && i < h
                out(i+1, j-1) = (1/8) * err;
            end

            if j < w
                out(i, j+1) = (3/8) * err;
            end

            if i < h 
                out(i+1, j) = (3/8)*err;
            end

            if i < h && j < w
                out(i+1, j+1) = (1/8)*err;
            end

        end
    end

    figure; imshow(out, []); title('quantizzazione + dithering');

end