function out = myimresize(img, k)
    [h, w] = size(img);

    hR = ceil(h*k);
    wR = ceil(w*k);
    
    out = zeros([hR, wR]);

    for i = 1:h
        for j = 1:w
            out(ceil(k*i), ceil(k*j)) = img(i, j);
        end
    end
end