function cube = rgbcube(img)
    [M, N, ~] = size(img);
    plot3(...
        reshape(img(:,:,1), 1, M * N), ...
        reshape(img(:,:,2), 1, M * N), ...
        reshape(img(:,:,3), 1, M * N), '.')

    xlabel('Red'), ylabel('Green'), zlabel('Blue')
    grid on

    cube.r = reshape(img(:,:,1), 1, M * N);
    cube.g = reshape(img(:,:,2), 1, M * N);
    cube.b = reshape(img(:,:,3), 1, M * N);
end