function se = createDisk(r)
    se = zeros(2*r+1);

    rr = r^2;

    for x = -r:r
        for y = -r:r
            if(x^2+y^2 <= rr)
                se(x+r+1, y+r+1) = 1;
            end
        end
    end
end
