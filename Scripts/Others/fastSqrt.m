function out = fastSqrt(img)
    img = single(img);

    lut = uint8(sqrt(255*(0:255)));

    out = lut(img);
end