function [dict] = huffman(symbols, freqs)
    %ordina in base alle frequenze
    [ord_freqs, indexes] = sort(freqs);
    %symbols = symbols(indexes);

    k = 1;
    treeNode(k).prevs(1) = ord_freqs(1);

    %FASE 1: RIDUZIONE DELLE FREQUENZE

    for i = 2:numel(ord_freqs)-1
        treeNode(k).prevs(end+1) = ord_freqs(i);
        treeNode(k).num = sum(treeNode(k).prevs);

        treeNode(k+1).prevs(1) = treeNode(k).num;
        k = k +1;
    end

    treeNode(numel(ord_freqs)-1).num = ord_freqs(end);
    
    codes(1).freq = treeNode(end).num;
    codes(1).code = "1";
    codes(2).freq = treeNode(end-1).num;
    codes(2).code = "0";

    k = 2;

    for i = numel(treeNode)-1:-1:1

        %si deve prendere la frequenza massima e a questa
        %sostituire il valore di k con i due prevs

        if(codes(k).freq > codes(k-1).freq)
            codes(k).freq = max([treeNode(i).prevs]);
            codes(k+1).freq = min([treeNode(i).prevs]);
    
            c = codes(k).code;
            codes(k).code = c + "0";
    
            codes(k+1).code = c + "1";
        else 
            codes(k+1).freq = max([treeNode(i).prevs]);
            codes(k).freq = min([treeNode(i).prevs]);
    
            c = codes(k).code;
            codes(k+1).code = c + "0";
    
            codes(k).code = c + "1";
        end

        k = k + 1;

    end

    %FASE 2: COSTRUZIONE DEL DIZIONARIO

    %siamo sicuri????
    tmp = codes(end);
    codes(end) = codes(end-1);
    codes(end-1) = tmp;


    for i = 1:numel(symbols)
        dict(i, :) = [symbols(i), codes(i).code];
    end


end