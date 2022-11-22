function out = newHam6(img)
    %passaggio a 4096 colori
    amiga = (round(img/17)*17); %quantizzazione a 4096 colori
    
    [ind, map] = rgb2ind(amiga,16);
    map = round(map*255);

    out = zeros(size(img));
    [h, w] = size(img, [1 2]);

    k = ind(1, 1);
    lastpx = [map(k+1, 1); map(k+1, 2); map(k+1, 3)];
    start = 2;
    out(1, 1, :) = lastpx;

    amiga = double(amiga);

    for i = 1:h
        for j = start:w
            %tecnica greedy: minimizzo l'errore localmente a ogni passo
            err = zeros([1 19]);
            
            for t = 1:16
                err(t) = sqrt(double((amiga(i,j,1) - map(t, 1))^2+ (amiga(i,j,2) - map(t, 2))^2 + (amiga(i,j,3) - map(t, 3))^2));
            end
                
            %mantengo verde e blu
            err(17) = sqrt(double((amiga(i,j,2) -lastpx(2))^2 + (amiga(i,j,3) - lastpx(3))^2));
            
            %mantengo rosso e blu
            err(18) = sqrt(double((amiga(i,j,1) -lastpx(1))^2 + (amiga(i,j,3) - lastpx(3))^2));
            
            %mantengo rosso e verde
            err(19) = sqrt(double((amiga(i,j,1) -lastpx(1))^2 + (amiga(i,j,2) - lastpx(2))^2));
            
            [~, p] = min(err);

            switch p
                case num2cell(1:16)
                    out(i,j, :) = map(p, :);
                case 17
                    out(i, j, :) = [amiga(i,j, 1); lastpx(2); lastpx(3)];
                
                case 18
                    out(i, j, :) = [lastpx(1); amiga(i,j, 2); lastpx(3)];

                case 19
                    out(i, j, :) = [lastpx(1); lastpx(2); amiga(i, j, 3)];
          
            end
            k = ind(i, j);
            lastpx = [map(k+1, 1); map(k+1, 2); map(k+1, 3)];
        end

        start = 1;

    end

    out = uint8(out);
end