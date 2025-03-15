function [out, dict] = lzw_encoder(sign)
    dict(256) = struct();

    for i = 1:256
        dict(i).seq = i;
    end


    sequence = [];
    concat = [];
    [h, w] = size(sign);
    out = [];

    for i = 1:h
        for j = 1:w
            %concatena l'intensità alla sequenza 
            %% 
            concat = sequence;
            concat(end+1) = sign(i, j);
            trovato = 0;

            for t = 1:numel(dict)
                if(isequal(dict(t).seq, concat) )
                    trovato = 1;
                    break;
                end
            end

            if(~trovato)
                %naive: usare doubling halving

                for t = 1:numel(dict)
                    if(isequal(dict(t).seq, sequence) )
                        break;
                    end
                end


                out(end+1) = t;

                dict(end+1).seq = concat;
                sequence = [sign(i, j)];
            else
                sequence = concat;
            end
        end
    end


    %nel for l'ultima sequenza riconosciuta viene esclusa
    for t = 1:numel(dict)
        if(isequal(dict(t).seq, sequence) )  
            out(end+1) = t;
        end 
    end
end