function lut = makeWindow(sz, h)
    i = (1:sz(1))'*ones(1, sz(2));

    j = floor((0:prod(sz)-1)/sz(1))+1;
    c = floor(sz/2)+1;

    i = i - c(1);
    j = j - c(2);
    
    lut = j'*h+i(:);   
end