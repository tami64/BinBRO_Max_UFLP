function [M] = GenM_Zmin(Xi,A)
n1 = sum(Xi);
Dim = length(Xi);
n0 = Dim - n1;

M = zeros(1,3);
minZ = inf;
for i=0:n1
    for j=0:n0
        M11= i;
        M01= n1-i;
        M10= j;
        %cost = costCompute(M)
        Z = abs(1 - M11/(M11 +M10 +M01) - A);
        if(Z<minZ)
            minZ = Z;
            M = [M11 M01 M10];
        end
    end
end
end

