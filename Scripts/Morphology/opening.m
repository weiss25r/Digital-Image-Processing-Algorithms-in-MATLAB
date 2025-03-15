function out = opening(lena, se)
    e = erode(lena, se);
    out = dilate(e, rot90(se, 2));
end