f = [13 4 15 6 3 4 10 8];

c = f*cos([0:7]'*[1:2:15]*pi/16)'.*sqrt([1,ones(1,7)+1]/8)



sqrt([1,ones(1,7)+1]/8).*c*cos((0:7)'*[1:2:15]*pi/16)