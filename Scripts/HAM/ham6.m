function [out, map, ctrl] = ham6(img)
    
    %quantizzazione immagine a 4096 colori
    [amiga, map] = rgb2ind(img, 4096);

    %immagine true color 4096 colori
    amiga = ind2rgb(amiga, map);

    %per leggere l'immagine senza usare i file
    %matrice che indica il ctrl del pixel(i, j) per ogni i, j
    ctrl = zeros(size(img, 1:2), 'uint8');
    
    %immagine indicizzata 16 colori
    [ind, map] = rgb2ind(amiga, 16);
    
    %per avere indici da 1 a 16.....
    ind = ind+1; 
    
    %immagine di output
    out = zeros(size(img));
    
    %dimensioni immagine
    [h, w, ~] = size(img);

    %codifica HAM6

    lastpx = [1, 1];
    for i = 1:h
        for j = 1:w
            if(i == 1 && j == 1)
                %il primo pixel necessariamente sarà in modalità HOLD
                %prendi il colore della tavolozza
                out(i, j, :) = map(ind(i,j), :);
            else
                %&metodo greedy: minimizzo l'errore locale
                %errore calcolato come distanza tra le terne
                
                %ctrl = 0
                errI = hamerror(amiga(i,j, 1), amiga(i,j,2), amiga(i,j,3), map(ind(i,j),1 ), map(ind(i,j),2), map(ind(i,j),3));

                %ctrl = 1
                errR = hamerror(amiga(i,j, 1), amiga(i,j,2), amiga(i,j,3), map(ind(i,j),1 ), out(lastpx(1),lastpx(2), 2), out(lastpx(1),lastpx(2), 3));

                %ctrl = 2
                errG = hamerror(amiga(i,j, 1), amiga(i,j,2), amiga(i,j,3), out(lastpx(1),lastpx(2), 1), map(ind(i,j),2), out(lastpx(1),lastpx(2), 3));

                %&ctrl = 3
                errB = hamerror(amiga(i,j, 1), amiga(i,j,2), amiga(i,j,3), out(lastpx(1),lastpx(2), 1), out(lastpx(1),lastpx(2), 2), map(ind(i, j), 3));

                %minimizzazione dell'errore
                minErr = min([errI, errR, errG, errB]);

                switch(minErr)
                    case errI
                        ctrl(i,j) = 0;
                        out(i, j, :) = map(ind(i, j), :);
                    case errR
                        ctrl(i, j) = 1;
                        out(i, j, 1) = map(ind(i, j), 1);
                        out(i, j, 2) = out(lastpx(1), lastpx(2), 2);
                        out(i, j, 3) = out(lastpx(1), lastpx(2), 3);
                    case errG
                        ctrl(i, j) = 2;
                        out(i, j, 1) = out(lastpx(1), lastpx(2), 1);
                        out(i, j, 2) = map(ind(i, j), 2);
                        out(i, j, 3) = out(lastpx(1), lastpx(2), 3);

                    otherwise
                        ctrl(i, j) = 3;
                        out(i, j, 1) = out(lastpx(1), lastpx(2), 1);
                        out(i, j, 2) = out(lastpx(1), lastpx(2), 2);
                        out(i, j, 3) = map(ind(i, j), 3);
                end

                lastpx = [i, j];
            end
        end
    end
end