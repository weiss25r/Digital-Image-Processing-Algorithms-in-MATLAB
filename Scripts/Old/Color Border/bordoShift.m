function bordoShift(img)
    dy = zeros(size(img), 'uint8');
    dy(1:end, 1:end-1) = img(1:end, 2:end);
    dy = img - dy;

    dx = zeros(size(img), 'uint8');
    dx(1:end-1, 1:end) = img(2:end, 1:end)
    dx = img - dx;

    figure; imshow(dx, []);
    figure; imshow(dy, []);
    figure; imshow(abs(dx+dy), [])
end