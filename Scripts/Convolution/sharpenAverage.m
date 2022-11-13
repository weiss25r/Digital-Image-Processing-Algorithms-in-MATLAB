function out = sharpenAverage(img, k)
    %img single a scala di grigio
    out = img + k*(img-conv2(img, fspecial('average'), 'same'));
end