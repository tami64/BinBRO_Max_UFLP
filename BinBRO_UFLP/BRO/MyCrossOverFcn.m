function [V] = MyCrossOverFcn(Xi,Xk,Dim,Method,Eval,model,theta)

%% For Case 4-6

switch Method
    case 1
        [Dsim,~] = Dsimilarity(Xi,Xk,Dim);
        if nargin<7
            theta = rand;
        end
        A = (1-theta) * Dsim;
        Mxiv = GenM_Zmin(Xi,A);
        V = GenerateV(Xi,Xk,Mxiv);%   Xk = best one
%         Fit = Eval(model,V);
    case 2 %'single'
        parent1 = Xi;
        parent2 = Xk;
        ub = Dim - 1;
        lb = 1;
        Cross_P = round (  (ub - lb) *rand() + lb  );
        
        Part1 = parent1(1:Cross_P);
        Part2 = parent2(Cross_P + 1 : Dim);
        child1 = [Part1, Part2];
        
        Part1 = parent2(1:Cross_P);
        Part2 = parent1(Cross_P + 1 : Dim);
        child2 = [Part1, Part2];
        
        
    case 3 %'double'
        parent1 = Xi;
        parent2 = Xk;
        ub = length(parent1) - 1;
        lb = 1;
        Cross_P1 = round (  (ub - lb) *rand() + lb  );
        
        Cross_P2 = Cross_P1;
        
        while Cross_P2 == Cross_P1
            Cross_P2 = round (  (ub - lb) *rand() + lb  );
        end
        
        if Cross_P1 > Cross_P2
            temp =  Cross_P1;
            Cross_P1 =  Cross_P2;
            Cross_P2 = temp;
        end
        
        Part1 = parent1(1:Cross_P1);
        Part2 = parent2(Cross_P1 + 1 :Cross_P2);
        Part3 = parent1(Cross_P2+1:end);
        
        child1 = [Part1 , Part2 , Part3];
        
        Part1 = parent2(1:Cross_P1);
        Part2 = parent1(Cross_P1 + 1 :Cross_P2);
        Part3 = parent2(Cross_P2+1:end);
        
        child2 = [Part1 , Part2 , Part3];
    case 4
        alpha = randi([0 1],size(Xi));      
        child1 = alpha.*Xi+(1-alpha).*Xk;
        child2 = alpha.*Xk+(1-alpha).*Xi;
end
% if Method>1
%     Fit_1 = Eval(model,child1);
%     Fit_2 = Eval(model,child2);
%     if Fit_1<=Fit_2 
%         V = child1;
%         Fit = Fit_1;
%     else
%         V = child2;
%         Fit = Fit_2;
%     end
% 
% end
if Method>1
    sel = randperm(2,1);
    if sel==1
        V = child1;
    else
        V = child2;
    end
%     Fit = Eval(model,child1);
end

