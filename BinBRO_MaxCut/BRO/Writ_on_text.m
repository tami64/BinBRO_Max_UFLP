function [outputArg1,outputArg2] = Writ_on_text(Dataset,Res,MeanCruve,CrossType)
fileID = fopen(['Results\CrosType_',num2str(CrossType),strcat('\F_',num2str(Dataset)),'.txt'],'w');

% fileID = fopen(['Results\',strcat('F_',num2str(Dataset)),'.txt'],'w');
for i =1:numel(MeanCruve)
        fprintf(fileID,'%d  ',Res.cg_curve(i));        
end

fprintf(fileID,'\n');
fprintf(fileID,'Mean  = %.3f \n',Res.MeanBest); 
fprintf(fileID,'Best  = %.3f \n',Res.Best);
fprintf(fileID,'Worst = %.3f \n',Res.Worst);
fprintf(fileID,'Std   = %.3f \n',Res.StdBest);

% fprintf(fileID,'Hit   = %.2f \n',Res.Hit);
% fprintf(fileID,'Gap   = %.2f \n',Res.Gap);
% fprintf(fileID,'Evl   = %.2f \n',Res.Evl);
fprintf(fileID,'NFE   = %.2f \n',Res.NFE);
fprintf(fileID,'Time  = %.2f \n',Res.MeanTim);
fprintf(fileID,'Dim   = %.2f \n',Res.Dim);

fclose(fileID);
disp('Finish.');

end


% 
% Res.fit(R) = flag.Fit;
% Res.MeanTim ;
% Res.MeanBest 
% Res.StdBest
