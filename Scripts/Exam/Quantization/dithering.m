function out = dithering(img)
    %quantizzazione a 16 colori

    img = single(img);
    map = single(round(0:255/15:255));
    map = map(floor((0:255)/16)+1);
    quant = map(img);
    figure; imshow(quant, []); title('immagine quantizzata a 16 colori');
    
    out = zeros(size(quant));
    %floyd-steinberg dithering

    [h, w] = size(img);

    for i = 1:h
        for j = 1:w
            %calcolo l'errore
            out(i, j) = quant(i,j);

            err = img(i, j)-quant(i, j);

            %diffondo l'errore ai pixel vicini
            if j > 1 && i < h
                quant(i+1, j-1) = quant(i+1, j-1) + (1/8) * err;
            end

            if j < w
                quant(i, j+1) = quant(i, j+1) + (3/8) * err;
            end

            if i < h 
                quant(i+1, j) = quant(i+1, j) + (3/8)*err;
            end

            if i < h && j < w
                quant(i+1, j+1) = quant(i+1, j+1) + (1/8)*err;
            end

        end
    end

    figure; imshow(out, []); title('quantizzazione + dithering');

end