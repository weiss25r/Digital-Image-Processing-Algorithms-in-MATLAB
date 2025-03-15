function piani = atrous(img, n)
    img = single(img);
    imgs = zeros([size(img), n+1]);
    imgs(:, :, 1) = img;
    start_ker = (1/16)*[1 2 1; 2 4 2; 1 2 1];
    piani = zeros([size(img), n]);
    ker = start_ker;
    
    for i = 2:n+1
        imgs(:, :, i) = conv2(imgs(:, :, i-1), ker, 'same');
        piani(:, :, i-1) = imgs(:, :, i-1)-imgs(:, :, i);

        %costruzione del nuovo kernel
        ker = create_kernel(start_ker, i);
    end
    
end