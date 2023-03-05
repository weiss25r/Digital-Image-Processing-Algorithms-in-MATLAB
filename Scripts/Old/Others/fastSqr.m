function out = fastSqr(img)
    lut = ((0:255).^2)/255;

    out = lut(img);
end