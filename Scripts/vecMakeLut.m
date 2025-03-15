function lut = vecMakeLut(ker, h)
    i = (1:size(ker, 1))'*ones(1, size(ker, 2));

    j = floor((0:numel(ker)-1)/size(ker, 1))+1;
    c = floor(size(ker)/2)+1;

    i = i - c(1);
    j = j - c(2);
    
    lut = j'*h+i(:);   
end