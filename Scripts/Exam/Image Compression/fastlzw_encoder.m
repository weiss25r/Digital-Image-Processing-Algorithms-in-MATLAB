function [out, dict] = fastlzw_encoder(sign)
    tic;
    dict(256) = struct();

    for i = 1:256
        dict(i).seq = i;
    end
    
    k = 256;
    sz = 256;

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
                for t = 1:numel(dict)
                    if(isequal(dict(t).seq, sequence) )
                        break;
                    end
                end


                out(end+1) = t;

                dict(k).seq = concat;
                k = k + 1;
                
                if(k > sz)
                    sz = sz * 2;
                    dict(sz).seq = 0;
                end

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

    toc;
    f = find(out(2:end) == 0, 1)+1;

    if(f)
        out = out(1:f);
    
end