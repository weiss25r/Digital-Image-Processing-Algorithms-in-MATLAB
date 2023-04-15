function out = final(img, r)
    [h, w] = size(img);
    img = single(img);
    
    [~, ~, dy, dx] = edge(img, 'sobel');
    a = atan2(-dy, -dx);
    m = sqrt(dx.^2 + dy.^2);
    c = cos(a);
    s = sin(a);

    sn = zeros(h, w, max(r) + 1);
    tr = zeros(h, w);

    for n = r
        %crea la matrice di accumulazione O
        on = zeros(h,w);

        %crea la matrice di accumulazione m
        mr = zeros(h, w);
        k = 8;

        if n > 1
            k = 9.9;
        end

        for i = n+1:h-n
            for j = n+1:w-n
                %calcola i pixel positivi e negativi
                px = round(n*c(i, j));
                py = round(n*s(i, j));
                p = [i j];
                m = [dx(i,j) dy(i,j)];
                gnorm = sqrt( m * m' ) ;
                
                
                if(gnorm > 0)
                    gp = round((m./gnorm) * n);
                    ppve = p + gp;
    
                    on(i+py, j+px) = or(i+py, j+px) + 1;
                    on(i-py, j-py) = or(i-py, j-px) - 1;
    
                    mr(i+py, j+px) = mr(i+py, j+px) + m(i, j);
                    mr(i-py, j-px) = mr(i-py, j-px) - m(i, j);
                end
            end
        end

        %calcola fn
        fn = (mr/k).*((abs(on)/k).^2);

        %convoluzione con filtro gaussiano
        sn(:, :, n) = conv2(fn, n*fspecial('gaussian', n, 0.5*n), 'same');
        tr = tr + sn(:, :, n);
    end

    out = tr;
end