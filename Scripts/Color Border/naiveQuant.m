function out = naiveQuant(img)
    %img in scala di grigio
    out = img;
    tav = round(0:255/15:255);

    [h, w] = size(out);
    
    for i = 1:h*w
        out(i) = tav(floor(out(i)/16)+1);
    end
end