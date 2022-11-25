function out = chiusura(img, se)
    %out = fastDilatation(fastErosion(img, se), rot90(se, 2));

    out = imerode(imdilate(img, se), se);
end