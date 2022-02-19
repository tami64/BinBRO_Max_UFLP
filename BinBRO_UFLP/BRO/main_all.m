% by Taymaz Akan / Saeid Agahian / Rahim Dehkharghani
%2021 BinBRO: Binary Battle Royale Optimizer Algorithm
% Expert system with application

clear, close all, clc
addpath('\..');
addpath('\..\..');
mkdir('Results\cruves');
addpath('Results\cruves');
mkdir('Results\CrosType_1\cruves');
mkdir('Results\CrosType_2\cruves');
mkdir('Results\CrosType_3\cruves');
mkdir('Results\CrosType_4\cruves');
CrossType = 3; %
fname_ = 'pw01_100';  % pw01_100  pw05_100  'pw09_100'
fileIdAll = fopen(['Results\CrosType_',num2str(CrossType),'\all_',fname_(1:4),'.txt'],'w');
% fileIdAll = fopen(['Results\','all','.txt'],'w');
for i = 0:9
    model = creat_model(strcat(fname_,'.',num2str(i)));
    Dim = model.Nnode;
    N = 100;
    maxiter = 300;
    MaxFault = 3;
    NumRun = 1;
    thetama = 1;
    thetami = 0.1;
    [Res,cg_curve] = BRO_Fun(N,Dim,maxiter,MaxFault,CrossType,NumRun,model,thetama,thetami);
    save(strcat('Results\CrosType_',num2str(CrossType),'\cruves\CR_',fname_,num2str(i),'.mat'),'cg_curve')
    save(strcat('Results\cruves\CR_',fname_,num2str(i),'.mat'),'cg_curve')
    Writ_on_text(strcat(fname_,'.',num2str(i)),Res,cg_curve,CrossType);
    Writ_on_text_all(Res,fileIdAll);    
end
fclose(fileIdAll);
Res
