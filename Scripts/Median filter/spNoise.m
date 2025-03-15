function noisy = spNoise(img, rate)
    [h, w] = size(img);
    
    pixs = round((rate/2)*h*w);

    perm = round(randperm(h*w, 2*pixs));
    noisy = img;



    noisy(perm(1:pixs)) = 0;
    noisy(perm(pixs+1:end)) = 255;
end