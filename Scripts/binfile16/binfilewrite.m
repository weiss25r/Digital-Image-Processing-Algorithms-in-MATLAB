function fs=binfilewrite(fs,n,k)
    %n = valore da scrivere su file
    %k = numero di bit da utilizzare
    %j = posizione buffer primo livello (16 bit)
    fs.j=fs.j-k; 
    fs.v(fs.i)=fs.v(fs.i)+bitshift(n,fs.j,'uint16');
    
    if fs.i==fs.bsz && fs.j<=0
        fwrite(fs.fid, fs.v(1:fs.bsz), 'uint16');
        fs.i=0;
        fs.v=zeros(1,fs.bsz,'uint16');
        fprintf('writing\n');
    end
    
    if fs.j==0
        fs.i=fs.i+1;
        fs.j=16; 
    end
    
    if fs.j<0
        fs.i=fs.i+1; 
        fs.j=fs.j+16; 
        fs.v(fs.i)=fs.v(fs.i)+bitshift(n,fs.j,'uint16');
    end

end