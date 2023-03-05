function out = IDCT(f)
    N = size(f,2);
    u = 0 : N-1;
    %x = (1:2:2*N);
    out = zeros(1,N);
    
    for x = 0 : N-1
        out(1,x+1) = uint8(sum(sqrt(2.^ceil(u/N)/N) .* f ...
                           .* cospi(((2*x+1)*u) / (2*N))));
    end
    
    %out = uint8(sum(sqrt(2.^ceil(u/N)/N) .* f ...
    %            .* cospi(((2.*x+1).*u) / (2*N))));
    
    %out
    %idct(dct(f))
end