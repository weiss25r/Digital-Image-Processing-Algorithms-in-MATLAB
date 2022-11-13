%noise = imnoise(img, 'salt & pepper', 0.1);

function out = noise(img, rate)
    hrate = rate/2;
    [w, h] = size(img);
    p = randperm(w*h);
    t = round(hrate*h*w);
    out = img;

    out(p(1:t)) = 0;
    out(p(t+1:2*t)) = 255;

    figure; imshow(out, [0 255]);
end