function fs=binfileopen(filename,rw,buffersize)
fs.type=rw;
fs.bsz=buffersize; 
fs.i=1;
fs.j=16;
fs.fid = fopen(filename, fs.type);

if strcmp(fs.type,'w')
    fs.v=zeros(1,fs.bsz,'uint16');
else
    fs.v=uint16(fread(fs.fid,fs.bsz,'uint16'));

end