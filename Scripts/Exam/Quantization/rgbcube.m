function cube = rgbcube(img)
    [M, N, ~] = size(img);
    

    cube.r = reshape(img(:,:,1), 1, M * N);
    cube.g = reshape(img(:,:,2), 1, M * N);
    cube.b = reshape(img(:,:,3), 1, M * N);
end