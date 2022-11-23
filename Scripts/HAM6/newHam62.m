function out = newHam62(img)
    %passaggio a 4096 colori
    quantImg = betterQuantN(img, 16);
    
    [ind, map] = rgb2ind(quantImg,16);
    map = round(map*255);

    out = zeros(size(img), 'uint8');
    [h, w] = size(img, [1 2]);

    k = ind(1, 1);
    prevpx = [map(k+1, 1); map(k+1, 2); map(k+1, 3)];
    start = 2;
    out(1, 1, :) = prevpx;

    quantImg = double(quantImg);

    for i = 1:h
        for j = start:w
            %tecnica greedy: minimizzo l'errore localmente a ogni passo
            err = zeros([1 19]);
            m = quantImg(i, j, :);
            m = m(:)';

            err(1:16) = sqrt(sum((map - m).^2, 2));

            %mantengo verde e blu
            err(17) = sqrt((quantImg(i,j,2) -prevpx(2))^2 + (quantImg(i,j,3) - prevpx(3))^2);
            
            %mantengo rosso e blu
            err(18) = sqrt((quantImg(i,j,1) -prevpx(1))^2 + (quantImg(i,j,3) - prevpx(3))^2);
            
            %mantengo rosso e verde
            err(19) = sqrt((quantImg(i,j,1) -prevpx(1))^2 + (quantImg(i,j,2) - prevpx(2))^2);
            
            [~, p] = min(err);

            switch p
                case num2cell(1:16)
                    out(i,j, :) = map(p, :);
                case 17
                    out(i, j, :) = [quantImg(i,j, 1); prevpx(2); prevpx(3)];
                
                case 18
                    out(i, j, :) = [prevpx(1); quantImg(i,j, 2); prevpx(3)];

                case 19
                    out(i, j, :) = [prevpx(1); prevpx(2); quantImg(i, j, 3)];
          
            end
            k = ind(i, j);
            prevpx = [map(k+1, 1); map(k+1, 2); map(k+1, 3)];
        end

        start = 1;

    end

end