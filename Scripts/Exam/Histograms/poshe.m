function out = poshe(img, blockSize)

    out = zeros(size(img), 'single');
    freq = zeros(size(img), 'single');

    [h, w] = size(img);
    
    stepSize = blockSize/2;

    stepR = stepSize(1);
    stepC = stepSize(2);

    di = blockSize(1);
    dj = blockSize(2);

    for i = 1:stepR:h-di+1
        for j = 1:stepC:w-dj+1
            out(i:i+di-1, j:j+dj-1) =out(i:i+di-1, j:j+dj-1) + single(histeq(img(i:i+di-1, j:j+dj-1)));
            freq(i:i+di-1, j:j+dj-1) = freq(i:i+di-1, j:j+dj-1) + 1;
        end
    end
    out = uint8((out./freq));
    figure; imshow(out, []);
end