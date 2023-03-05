function filebinari
    myopen;

    mywrite(9, 4);
    mywrite(3, 2);
    mywrite(33, 6);
    mywrite(17, 5);
    mywrite(65, 7);
    mywrite(17, 5);
    
    myclose;
end



function myopen
    global v i j buffersize;

    buffersize=3;
    i = 1;
    j = 8;
    v = zeros(1, buffersize, 'uint8');
    fprintf('opening\n');
end

function myclose
    global v i j

    if ~(i == 1 && j == 8)
        if j == 8
            i = i-1;
        end

        fprintf('flushing %s\n', num2str(v(1:i)));
    end

    fprintf('closing\n');
end

function mywrite(n, k)
    global v i j buffersize;

    j = j-k;
    v(i) = v(i)+bitshift(n, j, 'uint8');
    fprintf('%s i = %d j = %d\n', dec2bin(bitshift(n, j, 'uint8'), 8), i, j);

    if i == buffersize && j <=0
        fprintf('writing %s\n', num2str(v(1:buffersize)));
        i = 0;
        v = zeros(1, buffersize, 'uint8');
    end

    if j == 0
        i = i+1;
        j = 8;
    end

    if j < 0
        i = i+1;
        j = j+8;
        v(i) = v(i)+bitshift(n, j, 'uint8');
        fprintf('%s i = %d j = %d\n', dec2bin(bitshift(n, j, 'uint8'), 8), i, j)
    end
end

