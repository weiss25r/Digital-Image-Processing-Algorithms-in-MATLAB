function out = heckbert(img, n_colors)
    imgcube = rgbcube(img);
    imgcube.level = 0;
    cubes(1) = imgcube;
    ncubes = 2;

    %generazione dei cubi
   
    while(ncubes <= n_colors)
        [~, i] = min([cubes.level]);
        cube = cubes(i);
        [~, k] = max([max(cube.r)-min(cube.r), max(cube.g)-min(cube.g), max(cube.b)-min(cube.b)]);
        
        if(k == 1)
            med = median(cube.r);
            medIndex = find(cube.r == med, 1, 'last');            
        elseif(k == 2)
            med = median(cube.g);
            medIndex = find(cube.g == med, 1, 'last');
        else
            med = median(cube.b);
            medIndex = find(cube.b == med, 1, 'last');
        end

        %Cut

        cubeA.r = cube.r(1:medIndex);
        cubeA.g = cube.g(1:medIndex);
        cubeA.b = cube.b(1:medIndex);
        cubeA.level = cube.level+1;

        cubeB.r = cube.r(medIndex+1:end);
        cubeB.g = cube.g(medIndex+1:end);
        cubeB.b = cube.b(medIndex+1:end);
        cubeB.level = cube.level+1;

        cubes(i) = cubeA;
        cubes(ncubes) = cubeB;

        ncubes = ncubes+1;

    end

    for i = 1:numel(cubes)
        cubes(i).center = [mean(cubes(i).r), mean(cubes(i).g), mean(cubes(i).b)];
    end

    %fast remap
    [h, w] = size(img, 1:2);
    out = zeros(size(img));
    for i = 1:h
        for j = 1:w
            px = img(i, j, :);
            trovato = 0;
            for k = 1:n_colors
                for t = 1:numel(cubes(k).r)
                    if(cubes(k).r(t) == px(1) && cubes(k).g(t) == px(2) && cubes(k).b(t) == px(3))
                        trovato = 1;
                        break;
                    end
                end

                if(trovato)
                    kk = k;
                    break;
                end
            end

            out(i,j, :) = cubes(kk).center;
        end
    end

    out = uint8(out);
    figure; imshow(out, []);

end