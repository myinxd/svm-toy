function [PredictLabel,DecisionValue] = mySVMDecisionTri(x,model)
% [PredictLabel,DecisionValue] = mySVMDecisionTri(x,model)
% Decision function for three-type classification
%
% +-+-+--------------------+
% |1|1|                    |
% |v|v|  SVs from class 1  |
% |2|3|                    |
% +-+-+--------------------+
% |1|2|                    |
% |v|v|  SVs from class 2  |
% |2|3|                    |
% +-+-+--------------------+
% |1|2|                    |
% |v|v|  SVs from class 3  |
% |3|3|                    |
% +-+-+--------------------+
% 
% Inputs
% x: the feature vectors of samples to be estimated
% model: the trained SVM model
%
% Outputs
% PredictLabel: the estimated labels
% DecisionValue: the evaluated values
%
% Date: 2018/03/05
% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>

if (model.Parameters(2) == 2)
    gamma = model.Parameters(4);
    FunKel = @(u,v)(exp(-gamma.*sum((u-v).^2)));
elseif (model.Parameters(2) == 0)
    FunKel = @(u,v)(u*v');
end

%% Init
Beta = -model.rho;
NumClass = length(Beta);
% ClassLabel = model.Label;

DecisionValue = zeros(size(x,1),NumClass);
PredictLabel = zeros(size(x,1),1);

%% Get SVs
% Support vectors
SVs = full(moded.SVs);
SVs12 = [SVs(1:model.nSV(1),:); SVs(model.nSV(1)+1 : model.nSV(1)+ model.nSV(2),:)];
SVs13 = [SVs(1:model.nSV(1),:); SVs(model.nSV(1)+model.nSV(2)+1 : model.nSV(1)+ model.nSV(2)+ model.nSV(3),:)];
SVs23 = [SVs(model.nSV(1)+1 : model.nSV(1)+ model.nSV(2),:); SVs(model.nSV(1)+model.nSV(2)+1 : model.nSV(1)+ model.nSV(2)+ model.nSV(3),:)];

% Coefficients 
SV_coef12 = [model.sv_coef(1:model.nSV(1),1); model.sv_coef(model.nSV(1)+1 : model.nSV(1)+ model.nSV(2),1)];
SV_coef13 = [model.sv_coef(1:model.nSV(1),2);model.sv_coef(model.nSV(1)+model.nSV(2)+1 : model.nSV(1)+ model.nSV(2)+ model.nSV(3),1)];
SV_coef23 = [model.sv_coef(model.nSV(1)+1 : model.nSV(1)+ model.nSV(2),2); model.sv_coef(model.nSV(1)+model.nSV(2)+1 : model.nSV(1)+ model.nSV(2)+ model.nSV(3),2)];

for i = 1 : size(x,1)
    y1 = 0; y2 = 0; y3 = 0;
    for j = 1 : size(SVs12,1)
        u = SVs12(j,:);
        y1 = y1 + SV_coef12(j) * FunKel(u,x(i,:));
    end
    for j = 1 : size(SVs13,1)
        u = SVs13(j,:);
        y2 = y2 + SV_coef13(j) * FunKel(u,x(i,:));        
    end
    for j = 1 : size(SVs23,1)
        u = SVs23(j,:);
        y3 = y3 + SV_coef23(j) * FunKel(u,x(i,:));
    end
       
    DecisionValue(i,:) = [y1;y2;y3] + Beta;
    DV = DecisionValue(i,:);
    if (DV(1) > 0 && DV(2) > 0)
        PredictLabel(i) = 1;
    elseif (DV(1) < 0 && DV(3) > 0)
        PredictLabel(i) = 2;
    elseif (DV(2) < 0 && DV(3) < 0)
        PredictLabel(i) = 3;
    else
        PredictLabel(i) = find(abs(DV) == max(abs(DV)));
    end        
end