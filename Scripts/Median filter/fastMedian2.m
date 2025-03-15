function out = fastMedian2(img, sz)
    %padding delle immagini di input e di output
    out = ones(size(img));
    out = padarray(out, [sz(1)-1, sz(2)-1], 0, 'both');
    img = padarray(img, [sz(1)-1, sz(2)-1], 0, 'both');

    %si costruisce la finestra da usare per spazzolare img
    win = makeWindow(sz, size(img, 1));
    
    pixs = find(out);

    for i = 1:numel(pixs)
        out(pixs(i)) = median(img(win + pixs(i)));
    end

    %modalità 'same' di conv2
    out = out(max(1, sz(1)):min(end, end-(sz(1)-1)), max(1, sz(2)): min(end, end-(sz(2)-1)));
end