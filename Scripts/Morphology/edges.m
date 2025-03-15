function out = edges(img)
    se = makeCircle(1);
    se(5) = 3;

    out = dilate(img, se) - erode(img, se);
end