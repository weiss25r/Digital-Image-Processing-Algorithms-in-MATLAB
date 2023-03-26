function [out, dict] = lzw_encoder(sign)
    dict = string(0:255);
    sequence = "";
    [h, w] = size(sign);
    out = [];

    for i = 1:h
        for j = 1:w
            %concatena l'intensità alla sequenza 
            %% 
            concat = sequence + string(sign(i, j));

            index = find(dict == concat, 1);

            if(isempty(index))
                %naive: usare doubling halving
                out(end+1) = find(dict == sequence);

                dict(end+1) = concat;
                sequence = string(sign(i, j));
            else
                sequence = concat;
            end
        end
    end


    %nel for l'ultima sequenza riconosciuta viene esclusa
    out(end+1) = find(dict == sequence);

end