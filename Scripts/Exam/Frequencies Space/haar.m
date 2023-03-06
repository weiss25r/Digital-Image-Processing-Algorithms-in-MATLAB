function [lowpass, highpass] = haar(sign)
    lowpass = zeros(1, size(sign, 2)/2);
    highpass = lowpass;
    k = 1;

    for i = 1:2:size(sign, 2)
        oflowpass(k) = (sign(i)+sign(i+1))/2;
        highpass(k) = (sign(i)-sign(i+1))/2;
        k = k + 1;
    end

end