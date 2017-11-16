function [ Q ] = Qact( Qo, W , Pt, L)
MS = 1000;
MSL = 1000;
count=1;
while(1)
    lam = trace(Qo'*W*inv(W'*W)*W'*Qo);
    lamb = (lam/Pt)^0.5;
    lambda = lamb-1;
    if(lambda<0)
        lambda = 0;
    end
    V = (1/(1+lambda))*inv(W'*W)*W'*Qo;
    vi = 0;
    for i = 1:size(W,1)
        if(mod(i,L) == 1||L==1)
            vi = vi + 1;  
        end
        theta = (Qo(i,:)*(V(vi,:))');
        W(i, vi) = cos(angle(theta)) + j*sin(angle(theta));
    end
    MS = MSE(Qo-W*V);
    if(abs(MS - MSL) < 0.001)
        break;
    end;
    MSL = MS;
    count = count+1;
end
lam = trace(Qo'*W*inv(W'*W)*W'*Qo);
lamb = (lam/Pt)^0.5;
lambda = lamb-1;
if(lambda<0)
    lambda = 0;
end
V = (1/(1+lambda))*inv(W'*W)*W'*Qo;
Q = W*V;