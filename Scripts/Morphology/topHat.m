function th = topHat(img, se)
    th = img - opening(img, se);
end