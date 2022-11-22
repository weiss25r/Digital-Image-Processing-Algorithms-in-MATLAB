function testSwitch(p)

    switch(p)
        case num2cell(1:16)
            fprintf("1-16");
        case 17
            fprintf("17");
        case 18
            fprintf("18");
       case 19
            fprintf("19");
    end

    fprintf('\n');
end