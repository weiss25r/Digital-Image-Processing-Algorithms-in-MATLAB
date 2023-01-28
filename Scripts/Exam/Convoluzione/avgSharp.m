function out = avgSharp(img, a, k)
    avg = conv2(img, fspecial('average', a), 'same');
    hfreq = img - avg;

    out = img + k*hfreq;
end