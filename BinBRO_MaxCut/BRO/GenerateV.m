function V = GenerateV(Xi,Xk,M)
V = zeros(1,numel(Xi));
Pxi = find(Xi==1);
Qxi = find(Xi==0);
M11 = M(1);
M01 = M(2);
M10 = M(3);

M11XiXk = find(Xi&Xk);
dis = 1 - (M11/(M11 + M01 + M10));
lenPxi = size(Pxi,2);
if M11<=length(M11XiXk)
    temp1 = randperm(length(M11XiXk),M11); %temp1 = randperm(lenPxi,M11);
else    
    V(M11XiXk) = 1;
    onlyXi = setdiff(Pxi,M11XiXk);
    remain = M11-length(M11XiXk);
    temp1 = randperm(length(onlyXi),remain);
    V(onlyXi(temp1)) = 1;
end
lenQxi = size(Qxi,2);
temp2 = randperm(lenQxi,M10);
V(Qxi(temp2)) = 1;
end



