kernel = [2 1 1; 1 1 1; 1 1 1]/9;

res = zeros(size(lena));

for i = floor(3/2)+1 : 512 - floor(3/2)
    for j = floor(3/2)+1 : 512 - floor(3/2)
        t = 0;
        for x = -floor(3/2) : floor(3/2)
            for y = -floor(3/2) : floor(3/2)
                k =abs(x);
                l = abs(y);
                t = t + lena(i-x, j-y)*kernel(1,1);
            end
        end

        res(i, j) = t;
    end
end

imshow(res, []);