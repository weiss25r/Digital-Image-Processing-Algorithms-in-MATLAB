function out = iterative(img, t)
    t_prev = 0;

    while(t ~= t_prev)
        firstHalf = img(img > t);
        secondHalf = img(img <= t);

        u_one = sum(firstHalf)/numel(firstHalf);
        u_two = sum(secondHalf)/numel(secondHalf);

        t = (u_one+u_two)/2;
        t_prev = t;
        
    end

    out = t;
end