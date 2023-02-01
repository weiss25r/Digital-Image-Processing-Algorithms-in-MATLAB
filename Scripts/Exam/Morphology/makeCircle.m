function se = makeCircle(r)
    se = zeros(2*r+1);

    for i = -r:r
        for j = -r:r
            if(i^2+j^2 <= r^2)
                se(i+r+1, j+r+1) = 1;
            end
        end
    end
end