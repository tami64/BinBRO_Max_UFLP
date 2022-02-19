function [outputArg1,outputArg2] = Writ_on_text(Res,fileIdAll)

fprintf(fileIdAll,'Mean  = %.3f \n',Res.MeanBest); 
fprintf(fileIdAll,'Best  = %.3f \n',Res.Best);
fprintf(fileIdAll,'Worst = %.3f \n',Res.Worst);
fprintf(fileIdAll,'Std   = %.3f \n',Res.StdBest);

% fprintf(fileIdAll,'Hit   = %.2f \n',Res.Hit);
% fprintf(fileIdAll,'Gap   = %.2f \n',Res.Gap);
% fprintf(fileIdAll,'Evl   = %.2f \n',Res.Evl);
fprintf(fileIdAll,'NFE   = %.2f \n',Res.NFE);
fprintf(fileIdAll,'\n');
end


% 
% Res.fit(R) = flag.Fit;
% Res.MeanTim ;
% Res.MeanBest 
% Res.StdBest
