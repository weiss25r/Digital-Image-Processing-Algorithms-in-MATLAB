function out = kcontrast(img, r, k)
    out = zeros(size(img), 'uint8');
    se = strel('disk', r);
    a = apertura(img, se);
    c = chiusura(img, se);
    for i = 1:size(out, 1)
        for j = 1:size(out, 2)
            out(i,j) = max(0, min(255, (3*img(i,j))-a(i,j)-c(i,j)));
        end
    end
end