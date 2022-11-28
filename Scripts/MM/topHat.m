function out = topHat(img, se)
    out = img - apertura(img, se);
end