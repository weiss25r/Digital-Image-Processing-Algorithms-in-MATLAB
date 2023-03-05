function comparaConv(img, ker)
    img = single(img);

    convMat = uint8(conv2(img, ker,'full'));
    convNaive = uint8(naiveconv(img, ker));

    figure; imshow(img, []); title('immagine originale');
    figure; imshow(convMat, [0 255]); title('conv2 matlab');
    figure; imshow(convNaive, [0 255]); title('convNaive');

end