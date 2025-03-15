function out = bilinearResize(img, height, width)
    
    %https://chao-ji.github.io/jekyll/update/2018/07/19/BilinearResize.html
    [hi, wi] = size(img);

    out = zeros([height, width]);

    x_ratio = single(wi-1)/(width-1);
    y_ratio = single(hi-1)/(height-1);

    for i = 1:height
        for j = 1:width
            x_1 = max(1, min(wi, floor(x_ratio*j)+1));
            y_1 = max(1, min(hi, floor(y_ratio*i)+1));

            x_h = max(1, min(wi, ceil(x_ratio*j)));
            y_h = max(1, min(hi, ceil(y_ratio*i)));

            x_weight = x_ratio*j - x_1;
            y_weight = y_ratio*i - y_1;

            a = single(img(y_1, x_1));
            b = single(img(y_1, x_h));
            c = single(img(y_h, x_1));
            d = single(img(y_h, x_h));

            pixel = a*(1-x_weight)*(1-y_weight) + b*x_weight*(1-y_weight) + c*y_weight*(1-x_weight) + d*x_weight*y_weight;
            out(i, j) = pixel;
         end
    end
end