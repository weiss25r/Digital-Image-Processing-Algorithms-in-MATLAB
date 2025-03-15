function bh = bottomHat(img, se)
    bh = closure(img, se) - img;
end