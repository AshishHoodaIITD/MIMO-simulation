
t_count = zeros(1,10);
t_inst = zeros(1,10);
t_inst1 = zeros(1,10);
sigma = zeros(1,10);
power = zeros(1,10);
power(1,1) = 10;
sigma(1,1) = 1;
for k=2:10
    sigma(1,k) = sigma(1,k-1)/2;
end
% for l=2:10
%     power(1,l) = power(1,l-1)*2;
% end
for j=1:10
    for i=1:5000
        [e_count, e_inst] = Final(sigma(1,j),32,50);
        t_count(1,j) = e_count + t_count(1,j);
        t_inst(1,j) = e_inst + t_inst(1,j);
    end
end

% for j=1:10
%     for i=1:1000
%         [e_count, e_inst] = Final(sigma(1,j),32);
%         %t_count(1,j) = e_count + t_count(1,j);
%         t_inst1(1,j) = e_inst + t_inst1(1,j);
%     end
% end
plot(power,t_inst/4000,'-x','LineWidth',3);