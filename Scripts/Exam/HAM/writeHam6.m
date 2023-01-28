function writeHam6(img)
    %quantizzazione immagine a 4096 colori
    [amiga, map] = rgb2ind(img, 4096);

    %immagine true color 4096 colori
    amiga = ind2rgb(amiga, map);

    %per leggere l'immagine senza usare i file
    %matrice che indica il ctrl del pixel(i, j) per ogni i, j
    
    %immagine indicizzata 16 colori
    [ind, map] = rgb2ind(amiga, 16);
    
    %per avere indici da 1 a 16.....
    ind = ind+1; 
    
    %immagine di output
    out = zeros(size(img));
    
    %dimensioni immagine
    [h, w, ~] = size(img);

    %codifica HAM6 su file
    

end