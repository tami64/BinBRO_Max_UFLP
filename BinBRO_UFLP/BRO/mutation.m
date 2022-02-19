% function [X,Fit] = mutation(X,Fit,Eval,model)
function [X] = mutation(X,Fit,Eval,model)
Dim = length(X);

child =  X;
for i=1:3
    ind = randperm(Dim,2);
    temp = child(ind(1));
    child(ind(1)) = child(ind(2));
    child(ind(2)) = temp;
end
    X = child;
end