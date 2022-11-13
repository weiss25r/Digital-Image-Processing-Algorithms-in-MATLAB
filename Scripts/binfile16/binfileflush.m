function fs=binfileflush(fs)
if strcmp(fs.type,'w') && ~(fs.i==1 && fs.j==16)
    if fs.j==16, fs.i=fs.i-1; end
    fwrite(fs.fid, fs.v(1:fs.i), 'uint16');
    fprintf('flushing\n');
end