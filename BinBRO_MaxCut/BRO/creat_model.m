function [model] = creat_model(Fname)

a = dlmread(strcat('..\Dataset\',Fname));

Nnode = a(1,1);
Nedge = a(1,2);

W = sparse(a(2:end,1),a(2:end,2),a(2:end,3),Nnode,Nnode,Nedge);

model.W = W;
model.Nnode = Nnode;
model.Nedge = Nedge;


end



