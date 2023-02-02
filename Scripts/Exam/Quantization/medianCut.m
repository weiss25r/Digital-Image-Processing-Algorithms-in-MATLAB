function medianCut(img)
    %1) costruisce il cubo rgb iniziale
    imgR = img(:, :, 1);
    imgG = img(:, :, 2);
    imgB = img(:, :, 3);
    
    cube.r = min(imgR(:)):max(imgR(:));
    cube.g = min(imgG(:)):max(imgG(:));
    cube.b = min(imgB(:)):max(imgB(:));+
    
    cubes(0) = cube;
    


end