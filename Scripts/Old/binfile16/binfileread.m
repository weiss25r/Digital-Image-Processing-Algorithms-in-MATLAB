function [fs,n]=binfileread(fs,k)
    n = bitshift(bitshift(fs.v(fs.i),16-fs.j,'uint16'), -(16-k)); fs.j=fs.j-k;
    
    if fs.i==fs.bsz && fs.j<=0
        fs.i=0;
        fs.v=uint16(fread(fs.fid,fs.bsz,'uint16'));
    end

    if fs.j==0
        fs.i=fs.i+1;
        fs.j=16; 
    end

    if fs.j<0
        fs.i=fs.i+1; fs.j=fs.j+16; n=n+bitshift(fs.v(fs.i),-fs.j,'uint16');
    end
end