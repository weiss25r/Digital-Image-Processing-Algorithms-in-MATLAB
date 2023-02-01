function h = histogram(img)
    h = imhist(uint8(img), 256)';
    p = h(not(isoutlier(h)));
    %normalizzazione a 100, ceil per avere almeno 1 pixel nella barretta
    m = 101-ceil(100*double(p)/double(max(p(:))));
    out = zeros(120, 256, 'uint8')+255;

    for i = 1:numel(p)
        out(m(i):100, i) = 0;
        out(102:120, i) = i-1;
    end

    figure; imshow(out)
end