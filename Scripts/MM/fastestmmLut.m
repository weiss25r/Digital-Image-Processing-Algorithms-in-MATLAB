function lut = fastestmmLut(se, h)
    [x, y] = size(se);
    xx = floor(x/2);
    yy = floor(y/2);

    s =  h*(-yy:yy);
    p = -xx:xx;

    if(x ~= 1 && y ~=1)
        lut = s(1:x)+p(1:y)';
    elseif x == 1
        lut = s(1:y)';
    else
        lut = p(1:x);
    end

    lut = lut(se ~= 0);
end