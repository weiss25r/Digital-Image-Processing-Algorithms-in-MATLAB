function out = fastRadialSimmetry(img, raggi)
   %img single e scala di grigio
   %r set di raggi da utilizzare

   %sostituire con shift sx/alto
   [gy, gx] = gradient(img);
   

   [h, w] = size(img);
   offset = [max(raggi(:)), max(raggi(:))];
   s = zeros(numel(raggi), h+2*offset(1), w+2*offset(1));

   %versione light
   sIndex = 1;
   for n = raggi
       O_n = zeros(size(img)+2*offset);
       Ot_n = O_n;
       M_n = O_n;
       f = O_n;


       for i = 1:h
           for j = 1:w
               p = [i j];
               g = [gx(i,j) gy(i,j)];
               gnorm = sqrt(g*g');

               if(gnorm > 0)
                   gp = round((g./gnorm)*n);
                   ppve = p+gp+offset;

                   O_n(ppve(1), ppve(2)) = O_n(ppve(1), ppve(2))+1;
                   M_n(ppve(1), ppve(2)) = M_n(ppve(1), ppve(2))+gnorm;

               end

           end
       end

       if n == 1
           k = 8.8;
       else
           k = 9.9;
       end


       for i = 1:h
           for j = 1:w
              if(O_n(i, j) < k)
                  Ot_n(i, j) = O_n(ppve(1), ppve(2));
              else      
                  Ot_n(i, j) = k;  
              end

              f(i,j) = (M_n(i,j)/k)*(abs(Ot_n(i, j)/k)^2);
           end
       end

       gauss = fspecial('gaussian', [ceil(n/2), ceil(n/2)], n);
       s(sIndex, :, :) = conv2(f, gauss, 'same');
       sIndex = sIndex+1;

   end

   out = sum(s, 1);
end
