function writeNum(i, k)
    buffersize = 8;

    idwrite=binfileopen("numero.bin", 'w', buffersize);

    idwrite = binfilewrite(idwrite, i, k);
    binfileflush(idwrite);

    fclose(idwrite.fid);

    idread = binfileopen('numero.bin', 'r', buffersize);
    [idread, readed] = binfileread(idread, k);
    disp(readed);
    fclose(idread.fid);
end