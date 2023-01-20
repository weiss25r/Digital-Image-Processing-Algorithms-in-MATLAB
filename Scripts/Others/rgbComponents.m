function rgbComponents(img)
    imgRed(:, :, 1) = img(:, :, 1);
    imgRed(:, :, 2:3) = 0;

    imgGreen(:, :, 2) = img(:, :, 2);
    imgGreen(:, :, 3) = 0;
    
    imgBlue(:, :, 3) = img(:, :, 3);
    
    figure; imshow(imgRed, []); 
    figure; imshow(imgGreen, []);
    figure; imshow(imgBlue, []);

end