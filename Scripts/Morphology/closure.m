function out = closure(lena, se)
    e = dilate(lena, se);
    out = erode(e, rot90(se, 2));
end