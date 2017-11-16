function [ C ] = Rate( H, Q, var)
C = eye(size(H,1)) + (1/var)*H*Q*Q'*H';
C = det(C);
C = abs(C);
C = log2(C);
end

