function h = lHistogram(img)
    h = imhist(uint8(img), 256);
    w = isoutlier(h);
    m = 101-ceil(100*double(h(w == 0))/double(max(h(:))));
    out = zeros(120, 256, 'uint8')+255;

    for i = 1:256
        out(m(i):100, i) = 0;
        out(102:120, i) = i-1;
    end

    figure; imshow(out)
end