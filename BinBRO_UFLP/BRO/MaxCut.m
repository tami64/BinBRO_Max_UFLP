function [cost] = MaxCut(model,solution)
global NFE;
NFE = NFE + 1;

SumW = 0;
n = size(model.W,1);
c = 0;
% c = zeros(1,n);
for i = 1:n
     for j = 1:n
%         c(i,j) = model.W(i,j) * xor(solution(i),solution(j));
          c = c + model.W(i,j) * xor(solution(i),solution(j));
%         SumW = SumW + model.W(i,j);
     end    
end

% cost = 1;%sum(sum(c));
cost = c;
% for i = 1:model.Nnode
%     for j = 1: i-1
%         accum = accum + model.W(i,j) * xor(solution(i),solution(j));
%         SumW = SumW + model.W(i,j);
%     end
% end
% if SumW == 0
%     cost = 0
% else
% %     cost = accum/SumW;
%     cost = accum;
% end
