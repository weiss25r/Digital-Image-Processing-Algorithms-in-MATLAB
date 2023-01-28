function out = fastConv(img, ker)
    %si ruota di 180° il kernel
    ker = rot90(ker, 2);
    
    %per facilitare i calcoli, si converte a single l'immagine
    img = single(img);

    %si precalcolano i prodotti possibili tra i valori di grigio e i valori
    %del kernel
    prods = (0:255)'*ker(:)';

    %si trovano le dimensioni del kernel
    [hk, wk] = size(ker);
    n = numel(ker);

    %si effettua un padding dell'immagine in input e dell'immagine di
    %output
    out = ones(size(img));
    out = padarray(out, [hk-1, wk-1], 0, 'both');
    img = padarray(img, [hk-1, wk-1], 0, 'both');

    %si calcola la lut per l'accesso rapido ai pixel racchiusi dal kernel
    lut = vecMakeLut(ker, size(out, 1));
    
    %attraverso il comando find, si trovano tutti i pixel interessati dalla
    %convoluzione
    for i = find(out)
        t = 0;
        
        %si calcolano i prodotti scalari
        for k = 1:n
            t = t + prods(img(i+lut(k))+1, k);
        end

        out(i) = t;
    end

    %modalità 'same' di conv2
    out = out(max(1, hk):min(end, end-(hk-1)), max(1, wk): min(end, end-(wk-1)));

end