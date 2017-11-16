function [error_count, error_instances] = Final(sigma, Nt, Pt)
Nr = 4;
N = 4;
var = 1;
mean = 0;
Ha=(1/sqrt(2))*(var.*randn(Nr,Nt) + mean);
G =(1/sqrt(2))*(var.*randn(Nr,Nt) + mean);
Ha = complex(Ha,G);
Evar = sigma;
Er = (1/sqrt(2))*Evar.*randn(Nr,Nt);
Ec = (1/sqrt(2))*Evar.*randn(Nr,Nt);
E = complex(Er,Ec);
H = Ha + E;

L = Nt/N;
Ns = 4;

W = zeros(Nt, N);
c = 0;
for i=1:Nt
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        r = rand;
        W(i,c) = complex(r,sqrt(1-r*r));
end
S = zeros(Ns, 1);
for i=1:Ns
    if(mod(i,4)==0)
        S(i,1) = complex(1,1);
    elseif(mod(i,4)==1)
        S(i,1) = complex(-1,1);
    elseif(mod(i,4)==2)
        S(i,1) = complex(-1,-1);
    elseif(mod(i,4)==3)
        S(i,1) = complex(1,-1);
    end
end
[ Qo, lambda] = Qopt(Ha, Pt, Ns);
Qa = Qact(Qo,W,Pt,L);
X = Qa*S;
Nor = (1/sqrt(2))*Evar.*randn(Nr,1);
Noc = (1/sqrt(2))*Evar.*randn(Nr,1);
No = complex(Nor,Noc);
Y = Ha*X + No;
Tr = inv(Ha*Qa)*Y;

error_instances = 0;
error_count = 0;
for i=1:size(S)
    f = 0;
    if(real(S(i))*real(Tr(i))<0)
        error_count = error_count + 1;
        f=1;
    end
    if(imag(S(i))*imag(Tr(i))<0)
        error_count = error_count + 1;
        f=1;
    end
    if(f==1)
        error_instances = error_instances + 1;
    end
end

