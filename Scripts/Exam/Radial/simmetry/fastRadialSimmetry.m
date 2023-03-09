function out = fastRadialSimmetry(img, raggi)
   %img single e scala di grigio
   %r set di raggi da utilizzare

   %sostituire con shift sx/alto
   dx = conv2(img, fspecial('sobel'), 'same');
   dy = conv2(img, fspecial('sobel'), 'same')';

   g = sqrt(dx.^2+dy.^2);
   
   orient = zeros(size(img)); %double
   magn = zeros(size(img));
   f = zeros(size(img));
   [h, w] = size(img);
   s = zeros(h, w, size(raggi, 2));

   for k = 1:size(raggi)
       %calcola O_n e M_n
       for i = 1:h
            for j = 1:w

                t = 0;

                if(g(i,j) ~=0)
                    t = round(g(i, j)/norm(g(i, j)))*raggi(k);

                p_plus = [i+t, j+t];

                %p_neg = [i-t, j-t]+1;

                orient(p_plus(1), p_plus(2)) = orient(p_plus(1), p_plus(2))+1;

                %orient(p_neg) = orient(p_neg)+1;

                magn(p_plus(1), p_plus(2)) = magn(p_plus(1), p_plus(2))+norm(g(i,j));
                %magn(p_neg) = magn(p_neg)-norm(g(i,j));

                kn = 0;

                if(raggi(k) == 1) 
                    kn = 8.8;
                else
                    kn = 9.9;
                end

                
                f(i,j) = magn(p_plus(1), p_plus(2))/kn;

                if(orient(p_plus)<kn)
                    f(i,j) = f(i,j)*((abs(orient(p_plus(1), p_plus(2))/kn)^2));
                
                else
                    f(i,j) = f(i,j)*kn;
                end            
            end
       end

            s(:, :, k) = imgaussfilt(f, raggi(k));
       end
   end

   out = sum(s, 3);
end