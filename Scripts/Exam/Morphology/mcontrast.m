function out = mcontrast(img, k)
    se = makeCircle(k);
    a = floor(size(se)/2)+1;
    se(a(1), a(2)) = 3;
    
    o = single(opening(img, se));
    c = single(closure(img, se));

    out = max(0, min(255, 3*img-o-c));
end