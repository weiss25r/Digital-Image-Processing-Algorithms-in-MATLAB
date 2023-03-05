function med = findMedian(a)
    %naive: O(nlogn)
    a = sort(a);
    n = numel(a);

    if mod(n, 2) == 0
        med = ( a(floor(n/2)) + ( a(floor(n/2))+1) )/2;
    else
        med = a(floor(n/2)+1);
    end
   
end