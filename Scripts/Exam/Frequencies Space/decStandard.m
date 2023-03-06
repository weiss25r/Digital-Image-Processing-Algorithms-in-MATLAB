function [lowPassImg, highPassImg] = decStandard(img)
    %img in scala di grigio e di dimensione pari a potenze di 2
    [h, w] = size(img);
    lowPassImg = zeros(h, w/2);
    highPassImg = lowPassImg;

    %haar prima per righe


    
    for i = 1:h
        [lpass, hpass] = haar(img(i, :));

        lowPassImg(i, :) = lpass;
        highPassImg(i, :) = hpass;
    end

end