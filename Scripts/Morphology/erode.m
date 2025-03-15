function out = erode(img, se)
    %0 = fuori dalla sonda, 1 = dentro la sonda
    %2 = centro fuori dalla sonda, 3 = centro dentro la sonda

    %ricerca indici di interesse e traslazione nel centro di se
    [i, j] = find(se ==1 | se == 3);
    [ise, jse] = find(se == 2 | se == 3);

    [h, w] = size(img);
    [hse, wse] = size(se);

    %padding immagine
    out = ones(size(img), 'uint8');
    %si padda out a 0 per prendere solo gli indici di interesse
    out = padarray(out, [hse-1, wse-1], 0, 'both');

    %si padda img a 255 per evitare errori nel calcolo di min
    img = padarray(img, [hse-1, wse-1], 255, 'both');

    
    %img = padarray(img,[ise-1,jse-1],255,'pre');
    %img = padarray(img,[hse-ise,wse-jse],255,'post');    
    
    %tmp = padarray(tmp,[ise-1,jse-1],0,'pre');
    %tmp = padarray(tmp,[hse-ise,wse-jse],0,'post');

    %creazione lut
    lut = (j-jse)*size(img, 1) + (i-ise);

    %erosione
    for p = find(out)'
        out(p) = min(img(p+lut));
    end

    out = out(max(1, hse):min(end, end-(hse-1)), max(1, wse): min(end, end-(wse-1)));
end