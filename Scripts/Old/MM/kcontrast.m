function out = kcontrast(img, r, k)
    out = zeros(size(img), 'uint8');
    se = strel('disk', r);
    %{
    a = apertura(img, se);
    c = chiusura(img, se);

    a = double(a);
    c = double(c);
    img = double(img);
    %}

    th = topHat(img, se);
    bh = botHat(img, se);

%     for i = 1:size(out, 1)
%         for j = 1:size(out, 2)
%             %out(i,j) = max(0, min(255, (img(i,j)+th(i,j)-bh(i,j))));
%             out(i,j) = max(0, min(255, (3*img(i,j)-a(i,j)-c(i,j))));
%         end
%     end

    out = k*max(0, min(255, img+th-bh));
end