function out = histoutlier(img)
    h = imhist(img);
    out = h(isoutlier(h));
end