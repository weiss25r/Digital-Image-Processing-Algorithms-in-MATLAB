function out = fastGradiente(img)
    shift = zeros(size(img));
    shift(:, 1:end-1) = img(:, 2:end);
    
    out = img - shift;
end