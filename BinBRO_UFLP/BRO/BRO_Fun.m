function [Res,cg_curve1] = BRO_Fun(N,Dim,maxiter,MaxFault,CrossType,NumRun,model,thetama,thetami)
global NFE;
Res = [];
tic
cg_curve1 = zeros(1,maxiter);
Hit = 0;
Gap = 0;
EVL = [];
ListNFE = [];
for R = 1:NumRun
    NFE = 0;
    disp(['Run: ' num2str(R) ' Start' ])
    Shrink = ceil(log10(maxiter));
    Step = round(maxiter/Shrink);
    %%
    soldier.xy = [];
    soldier.Fit = [];
    soldier.Fault  = zeros(1,N);
    flag.Fit = 0;
    soldier.xy = [];
    flag.xy = [];
    Eval = @MaxCut;
    %     ShrinkMinMax = XMinMax;
    
    %% Initialization
    soldier.xy = randi([0 1],N,Dim);
  
    for i=1:N
        soldier.Fit(i) = Eval(model,soldier.xy(i,:));
    end
           
    [flag.Fit,indx] = max(soldier.Fit);
    flag.xy = soldier.xy(indx,:);
    
    %%
    STDdim = zeros(Dim,1);
    cg_curve = zeros(1,maxiter);
    for iter = 1:maxiter
        %         theta = thetama-((thetama-thetami)/maxiter)*iter;
        theta = Dim-((Dim-1)/maxiter)*iter;
        a = theta/Dim;
        cg_curve(iter) = flag.Fit;
        for i = 1:N
            [~,Cn] =  Dsimilarity(soldier.xy(i,:),soldier.xy,i);
            dam = i;
            Vic = Cn;
            if (soldier.Fit(Cn) < soldier.Fit(i))
                dam = Cn;
                Vic = i;
            end
            soldier.Fault(dam)= soldier.Fault(dam) + 1;
            soldier.Fault(Vic) = 0;
            if (soldier.Fault(dam) < MaxFault)
%                 [soldier.xy(dam,:) soldier.Fit(dam)]= MyCrossOverFcn(soldier.xy(dam,:),flag.xy,Dim,CrossType,Eval,model);
                [soldier.xy(dam,:)]= MyCrossOverFcn(soldier.xy(dam,:),flag.xy,Dim,CrossType,Eval,model);
                %%%%% mutation for Dam
                if rand<0.3
                    [soldier.xy(dam,:)] = mutation(soldier.xy(dam,:),soldier.Fit(dam),Eval,model);
                end
                %%%%%%%%%%%%%%%%%
                soldier.Fit(dam) =  Eval(model,soldier.xy(dam,:));
            else
                b = randperm(Dim,ceil(a*Dim));
                soldier.xy(dam,b) = randi([0 1],1,numel(b));
                soldier.Fault(dam) = 0;
                soldier.Fit(dam) = Eval(model,soldier.xy(dam,:));
            end
%             [soldier.xy(Vic,:),soldier.Fit(Vic)] = mutation(soldier.xy(Vic,:),soldier.Fit(Vic),Eval,model);
                
                %%%%% mutation for Vic
                if rand<0.3
                    [soldier.xy(Vic,:)] = mutation(soldier.xy(Vic,:),soldier.Fit(Vic),Eval,model);
                end
                soldier.Fit(Vic) =  Eval(model,soldier.xy(Vic,:));
%             [flag.xy,flag.Fit] = mutation(flag.xy,flag.Fit,Eval,model);

            if(soldier.Fit(dam)>flag.Fit)
                flag.Fit = soldier.Fit(dam);
                flag.xy = soldier.xy(dam,:);
            end
            if(soldier.Fit(Vic)>flag.Fit)
                flag.Fit = soldier.Fit(Vic);
                flag.xy = soldier.xy(Vic,:);
            end
        end
        disp([num2str(iter),'   ',num2str(flag.Fit)]);
        %%%%% mutation for Flag
        [temp_xy] = mutation(flag.xy,flag.Fit,Eval,model);
        temp_Fit = Eval(model,flag.xy);
        if temp_Fit>flag.Fit
            flag.Fit = temp_;
            flag.xy = temp_xy;
        end 
        %%%%%%%%%
    end
    ListNFE(R) = NFE;
    
    Res.fit(R) = flag.Fit;
    cg_curve1 = cg_curve1 + cg_curve;   
    
end
cg_curve1 = cg_curve1/NumRun;
MeanTim = toc/NumRun;
MeanBest = mean(Res.fit);
Best = max(Res.fit);
Worst = min(Res.fit);
StdBest = std(Res.fit);

Res.cg_curve = cg_curve;
Res.MeanTim =  MeanTim;
Res.MeanBest = MeanBest;
Res.Best = Best;
Res.Worst = Worst;
Res.StdBest = StdBest;
Res.NFE = mean(ListNFE);
Res.Dim = Dim;
Res.sol = flag.xy;
end
