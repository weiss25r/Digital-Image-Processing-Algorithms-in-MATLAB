function out = DCT(f)
    N = size(f,2);
    x = 0 : N-1;
    %u = (1:2:2*N);
    out = zeros(1,N);
    
    for u = 0 : N-1
        out(1,u+1) = sqrt(2^ceil(u/N)/N) * sum(f ...
                          .* cospi(((2*x+1)*u) / (2*N)));
    end
    
    %out = sqrt(2.^ceil(u/N)/N) * sum(f ...
    %           .* cospi(((2*x+1).*u) / (2*N)));
                      
    %out
    %dct(f)
end