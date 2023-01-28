function out = hamerror(r1, g1, b1, r2, g2, b2)
    out = sqrt((r2-r1)^2 + (g2-g1)^2 + (b2-b1)^2);
end