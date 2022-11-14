function out = betterQuant3(img)
    out = img;

    map = round(0:255/15:255);
    map = map(floor((0:255)/16)+1);

    out(:, :, 1) = map(img(:, :, 1) + 1);
    out(:, :, 2) = map(img(:, :, 2) + 1);
    out(:, :, 3) = map(img(:, :, 3) + 1);

    figure; imshow(out,[]); title('immagine quantizzata');
end