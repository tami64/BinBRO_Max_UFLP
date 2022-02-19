function [minVal,minIndex] = Dsimilarity(Xi,Xk,i)
[U V] = size(Xk);
for j = 1:U
    
    M11 = sum((Xi==1) & (Xk(j,:)==1));
    M01 = sum((Xi==0) & (Xk(j,:)==1));
    M10 = sum((Xi==1) & (Xk(j,:)==0));
    
    Similarity1 = M11/(M01+M10+M11);
    DisXik (j)= 1 - Similarity1;
end

if U>1
    DisXik(i) = inf;
end
[minVal,minIndex] = min(DisXik);

end

