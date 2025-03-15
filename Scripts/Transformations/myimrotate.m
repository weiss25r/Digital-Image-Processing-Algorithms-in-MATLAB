function out = myimrotate(img,angle)
    [hi, wi] = size(img);
    h = round(hi/2);
    w = round(wi/2);

    asc = [ceil(-w*cosd(angle)-h*sind(angle)), ceil(w*cosd(angle)-h*sind(angle)), ceil(-w*cosd(angle)+h*sind(angle)), ceil(w*cosd(angle)+h*sind(angle))];
    ord = [ceil(-w*sind(angle)-h*cosd(angle)), ceil(w*sind(angle)-h*cosd(angle)), ceil(-w*sind(angle)+h*cosd(angle)), ceil(+w*sind(angle)+h*cosd(angle))];

    H = max(ord)-min(ord);
    W = max(asc)-min(asc);

end