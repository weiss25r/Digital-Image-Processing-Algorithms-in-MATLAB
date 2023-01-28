function rgb = readHam6(filename, map, h, w)
    
    rgb = zeros(h, w, 3);
    file = binfileopen(filename, 'r', 8);
    lastpx = [1 1];

    for i = 1:h
        for j = 1:w
            %leggo ctrl
            [file, ctrl] = binfileread(file, 2);

            %leggo i dati
            [file, data] = binfileread(file, 4);
            data = data+1;

            switch(ctrl)
                case 0
                    rgb(i, j, :) = map(data, :);

                case 1
                    rgb(i, j, 1) = map(data, 1);
                    rgb(i, j, 2:3) = rgb(lastpx(1), lastpx(2), 2:3);

                case 2
                    rgb(i, j, 2) = map(data, 2);
                    rgb(i, j, 1) = rgb(lastpx(1), lastpx(2), 1);
                    rgb(i, j, 3) = rgb(lastpx(1), lastpx(2), 3);
                otherwise
                    rgb(i, j, 3) = map(data, 3);
                    rgb(i, j, 1) = rgb(lastpx(1), lastpx(2), 1);
                    rgb(i, j, 2) = rgb(lastpx(1), lastpx(2), 2);
            end

            lastpx = [i, j];
        end
    end

    fclose(file.fid);
end