function [out, map16] = readHam6(img,map16)
    out = zeros(size(img, 1), size(img, 2),3,'double');
    [h,w] = size(img);

    li = 1;
    li = 1;

    for i = 1 : h  
        for j = 1 : w  
            if(img(i,j) < 16)                   %controllo 00xxxx
                out(i,j) = map16(img(i,j)+1);

            elseif(img(i,j) < 32)               %controllo 01xxxx
                out(i,j,1) = img(i,j)-16;
                out(i,j,2) = out(li,lj,2);
                out(i,j,2) = out(li,lj,3);

            elseif(img(i,j) < 48)               %controllo 10xxxx
                out(i,j,1) = out(li,lj,1);
                out(i,j,2) = img(i,j)-32;
                out(i,j,3) = out(li,lj,3);

            else                                %controllo 11xxxx
                out(i,j,1) = out(li,lj,1);
                out(i,j,2) = out(li,lj,2);
                out(i,j,3) = img(i,j)-48;
            end
            lj = j;
        end
        li = i;
    end 

    figure; imshow(out, [0 255]);

end