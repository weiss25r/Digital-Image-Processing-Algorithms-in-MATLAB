function binfile

    buffersize=1024;
         
    num=4096; 
    filebuffer=zeros(1,num);
    idwrite=binfileopen('binfile.bin','w',buffersize);
    scrittura=zeros(1,num);

    for i=1:1
        filebuffer(i)=randi(16);
        scrittura(i)=randi(2^filebuffer(i))-1;
        idwrite=binfilewrite(idwrite,scrittura(i),filebuffer(i));
    end
    binfileflush(idwrite);
    fclose(idwrite.fid); clear idwrite
    
    
    idread=binfileopen('binfile.bin','r',buffersize);
    lettura=zeros(1,num);
    for i=1:num
        [idread,lettura(i)]=binfileread(idread,filebuffer(i));
        disp(lettura(i));
    end
    fclose(idread.fid); clear idread
    
    
    if isequal(scrittura,lettura) && isequal(dir('binfile.bin').bytes,2*ceil(sum(filebuffer)/16))
        fprintf('file ok. sprecati %d byte\n',dir('binfile.bin').bytes-ceil(sum(filebuffer)/8))
end