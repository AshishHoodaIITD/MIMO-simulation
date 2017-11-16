function [ Q, lamd ] = Qopt( H , P ,Ns)
var = 1;
E = eig(H'*H,'vector');
[V,D] = eig(H'*H);
[E , I] = sort(E,'descend');
E = E';
E = E(1:Ns);
S = Waterfilling(E, P, var);
lambda = zeros(size(H,2),Ns);
sigma = zeros(Ns,Ns);
c = 1;
for i = 1:Ns
    for k = 1:size(H,2)
        lambda(k,c) = V(k,I(c));
    end
    c=c+1;
    sigma(i,i) = S(i);
end
Q = lambda*((sigma)^0.5);
lamd = lambda;