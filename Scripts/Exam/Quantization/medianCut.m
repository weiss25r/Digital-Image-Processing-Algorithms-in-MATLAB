function [out, cubes] = medianCut(img, maxColors)
    %1) costruisce il cubo rgb iniziale
    imgR = img(:, :, 1);
    imgG = img(:, :, 2);
    imgB = img(:, :, 3);
    
    startCube.r = min(imgR(:)):max(imgR(:));
    startCube.g = min(imgG(:)):max(imgG(:));
    startCube.b = min(imgB(:)):max(imgB(:));
    startCube.level = 0;
    
    cubes(1) = startCube;

    while numel(cubes) < maxColors
        %si cerca il cubo col minor livello
        [~, i] = min([cubes.level]);

        cube = cubes(i);

        %cerca l'asse più lungo
        [~, index] = max([numel(cube.r), numel(cube.g), numel(cube.b)]);
        switch(index)
            case 1
                %cut al mediano
                b = cumsum(cube.r);
                med = find(b >= b(end)/2);
        
                cubeA.r = cube.r(1:med);
                cubeA.g = cube.g;
                cubeA.b = cube.g;
        
                cubeB.r = cube.r(med:end);
                cubeB.g = cube.g;
                cubeB.b = cube.b;

            case 2
                b = cumsum(cube.g);
                med = find(b >= b(end)/2);
        
                cubeA.r = cube.r;
                cubeA.g = cube.g(1:med);
                cubeA.b = cube.g;
        
                cubeB.r = cube.r;
                cubeB.g = cube.g(med:end);
                cubeB.b = cube.b;
            
            otherwise
                b = cumsum(cube.b);
                med = find(b >= b(end)/2);
        
                cubeA.r = cube.r;
                cubeA.g = cube.g;
                cubeA.b = cube.b(1:med);
        
                cubeB.r = cube.r;
                cubeB.g = cube.g;
                cubeB.b = cube.b(1:end);
        end

        cubeA.level = cube.level+1;
        cubeB.level = cube.level+1;

        cubes(i) = cubeA;
        cubes(end+1) = cubeB;         
    end
    
    out = quantization(img, cubes);

end