function out = myrgb2gray(img)
     out = uint8(0.299*img(:, :, 1)+0.587*img(:, :, 2)+0.114*img(:, :, 3));
end