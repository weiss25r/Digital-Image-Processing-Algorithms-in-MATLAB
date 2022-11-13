function out = contaColori(img)
    %img in uint8
    colors = min(img(:)):max(img(:));
    
    colors(img) = 1;

    out = numel(find(colors == 1));
end