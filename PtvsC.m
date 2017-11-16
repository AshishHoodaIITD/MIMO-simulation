Nr=4;
Nt=64;
Ns=16;
var = 1;
H=sqrt(Nt*Nr)*random('rayl',Nr,Nt);
G = sqrt(Nt*Nr)*random('rayl',Nr,Nt);
H = complex(H,G);

H2=sqrt(Nt*Nr)*random('rayl',Nr,Nt);
G2 = sqrt(Nt*Nr)*random('rayl',Nr,Nt);
H2 = complex(H2,G2);

H3=sqrt(Nt*Nr)*random('rayl',Nr,Nt);
G3 = sqrt(Nt*Nr)*random('rayl',Nr,Nt);
H3 = complex(H3,G3);
 Pt = ones(1,10);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1:10
    Pt(j) = j;
end
C = ones(size(Pt));
S = ones(1,10);
for j = 10:20
    S(j) = j;
end
N = ones(size(S));
for i = 1:size(Pt,2)
    G = H;
    Pt(i)=10^(i);
    C(i) = Rate(G, Qopt(G, Pt(i), Ns), var);
end
for i = 1:size(S,2)
    G = H;
    N(i) = Rate(G, Qopt(G, 5, S(i)), var);
end
%plot(10*log10(Pt),C,'-x','LineWidth',3);
%hold on;
%scatter(Pt, C);
% %hold;
% %scatter(S,N);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pt = 50;
Nt=64;
N = 8;
L = Nt/N;
W1 = zeros(Nt, N);
c = 0;
for i=1:Nt
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        W1(i,c) = complex(rand,rand);
end
Nt = 64;
N = 16;
L = Nt/N;
W2 = zeros(Nt, N);
c=0;
for i=1:Nt
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        W2(i,c) = complex(rand,rand);
end
Nt = 64;
N = 32;
L = Nt/N;
W3 = zeros(Nt, N);
c=0;
for i=1:Nt
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        W3(i,c) = complex(rand,rand);
end
N = 4;
L = 16/N;
W31 = zeros(16, N);
c=0;
for i=1:16
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        W31(i,c) = complex(rand,rand);
end
N = 4;
L = 32/N;
W32 = zeros(32, N);
c=0;
for i=1:32
   if(mod(i,L)==1||L==1)
        c=c+1;
   end
        W32(i,c) = complex(rand,rand);
end
%  Qo = Qopt(H, Pt, Ns);
%  Qa = Qact(Qo, W1, Pt, 4);
% Rate(H ,Qo, var)
% Rate(H, Qa, var)

Pt = ones(1,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1:10
    Pt(j) = j/10;
end
C = ones(size(Pt));
A1 = ones(size(Pt));
A2 = ones(size(Pt));
A3 = ones(size(Pt));
B1 = ones(size(Pt));
B2 = ones(size(Pt));
for i = 1:size(Pt,2)
    G = H;
     Pt(i)=(1)*10^(0.2*(i-1));
     C(i) = Rate(G, Qopt(G, Pt(i), Ns), var);
     A1(i) = Rate(H, Qact(Qopt(H, Pt(i), Ns), W1, Pt(i), 64/size(W1,2)), var);
     A2(i) = Rate(H3, Qact(Qopt(H3, Pt(i), Ns), W2, Pt(i), 64/size(W2,2)), var);
     A3(i) = Rate(H2, Qact(Qopt(H2, Pt(i), Ns), W3, Pt(i), 64/size(W3,2)), var);
     %B1(i) = Rate(H2, Qact(Qopt(H2, Pt(i), Ns), W31, Pt(i), 16/size(W31,2)), var);
     %B2(i) = Rate(H3, Qact(Qopt(H3, Pt(i), Ns), W32, Pt(i), 32/size(W32,2)), var);
end
%scatter(10*log10(Pt),C,'filled');
%hold on;
plot(10*log10(Pt),A1,'-x',10*log10(Pt),A2,'--',10*log10(Pt),A3,'-o','LineWidth',3);
%plot(10*log10(Pt),A3,'-x',10*log10(Pt),B1,'--',10*log10(Pt),B2,'-o','LineWidth',3);
%scatter(10*log10(Pt),A1,'filled', 'yellow');
%hold on;
%scatter(10*log10(Pt),A2,'filled','green');
%hold on;
%scatter(10*log10(Pt),A3,'filled','red');