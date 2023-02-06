function out = mydct(f)
    N = size(f,2);
    out = f * ...                                       % f
          cos((0:N-1)' * (1:2:2*N-1)*pi/(2*N))' .* ...  % cos
          sqrt([1,ones(1,N-1)+1]/N);                    % a(u)
end