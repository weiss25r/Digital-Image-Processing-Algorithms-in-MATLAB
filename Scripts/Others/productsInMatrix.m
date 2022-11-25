function out = productsInMatrix(a, b)
    a = a(:)';
    out = b'*a;
end