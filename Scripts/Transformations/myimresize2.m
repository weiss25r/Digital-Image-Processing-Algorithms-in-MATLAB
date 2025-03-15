function out = myimresize2(img, k)
    [h, w] = size(img);

    hR = ceil(h*k);
    wR = ceil(w*k);
    
    out = zeros([hR, wR]);

    for i = 1:hR
        for j = 1:wR
            out(i, j) = img(ceil(i/k), ceil(j/k));
        end
    end
end