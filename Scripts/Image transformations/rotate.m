function out = rotate(img,angle)
    [h,w] = size(img);
    h = floor(h/2);
    w = floor(w/2);
    
    asc = round([-w*sind(angle) + -h*cosd(angle)...
                  w*sind(angle) + -h*cosd(angle)...
                  w*sind(angle) + h*cosd(angle)...
                 -w*sind(angle) + h*cosd(angle)]);
    
    ord = round([-w*cosd(angle) - -h*sind(angle)...
                  w*cosd(angle) - -h*sind(angle)...
                  w*cosd(angle) - h*sind(angle)...
                 -w*cosd(angle) - h*sind(angle)]);
            
    H = max(asc) - min(asc)
    W = max(ord) - min(ord)
    
    out = zeros(H,W);
    
    H2 = floor(H/2);
    W2 = floor(W/2);
    
    for i = -H2 : H2
        for j = -W2 : W2
            v = round([i*cosd(angle) + j*sind(angle)...
                       j*cosd(angle) - i*sind(angle)]);
            
            if((v > [-w,-h]) & (v < [w,h]))
                out(i+W2,j+H2) = img(v(1)+w,v(2)+h);
            end
        end
    end
    
    figure;imshow(out,[]);
end