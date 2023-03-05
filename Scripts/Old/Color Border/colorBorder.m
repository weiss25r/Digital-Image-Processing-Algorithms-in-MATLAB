function colorBorder(img)
    dx = conv2(img, fspecial('sobel'), 'same');
    dy = conv2(img, fspecial('sobel')', 'same');
    m = sqrt(dx.^2 + dy.^2);    

    at = atan2(dy, dx);
    a = round(360*(at+pi)/(2*pi));
    b = ind2rgb(a, hsv(360));
    
    m = double(m/255);

    figure; imshow(m.*b, []);
end