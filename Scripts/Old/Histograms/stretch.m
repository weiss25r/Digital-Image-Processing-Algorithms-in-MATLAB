function out = stretch(img)
    ming = double(min(img(:)));
    maxg = double(max(img(:)));

    out = uint8(255*((double(img)-ming)/(maxg-ming)));
end