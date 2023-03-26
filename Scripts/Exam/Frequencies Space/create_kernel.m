function ker = create_kernel(prev_ker, i)
    power = 2*(i-1);
    a = ([1, 1] - size(prev_ker) + 1)*power;

    first = a + size(prev_ker);
    last = -a + size(prev_ker);

    [h, w] = size(prev_ker);

    ker(last(1), last(2)) = 0;

    for i = 1:h
        for j = 1:w
            ker(1+power*(i-1), 1+power*(j-1)) = prev_ker(i, j);
        end
    end
    
end