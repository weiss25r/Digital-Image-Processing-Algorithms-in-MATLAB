function out = quantization(img, cubes)
    %per ogni cubo calcolo il centroide

    for i = 1:numel(cubes)
        centroidi(i).r = sum(cubes(i).r)/numel(cubes(i).r);
        centroidi(i).g = sum(cubes(i).g)/numel(cubes(i).g);
        centroidi(i).b = sum(cubes(i).b)/numel(cubes(i).b);
    end

    [h, w] = size(img, 1:2);
    out = zeros(size(img));


    for i = 1:h
        for j = 1:w
            pix = img(i, j, :);
            
            for k = 1:numel(cubes)
                a = cubes(k).r == pix(1);
                b = cubes(k).g == pix(2);
                c = cubes(k).b == pix(3);
                
                if(any([a, b, c]))
                    pix = centroidi(k);
                end
            end

            out(i, j, :) = pix;

        end
    end

end