function out = myeq(img)
    s = numel(img)/255;

    lut = uint8(cumsum(imhist(uint8(img))/s));
    out = lut(img+1);
end