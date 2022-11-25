function out = apertura(img, se)
    %out = fastDilatation(fastErosion(img, se), rot90(se, 2));

    %out = dilatation(erosion(img, se), rot90(se, 2));
    
    out = imdilate(imerode(img, se), se);
end