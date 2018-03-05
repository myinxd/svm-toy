function plabel = mySVMDecision(x,model,thrs)
% plabel = mySVMDecision(x,model)
% Decision function: two-class case
%
% inputs
% x: the feature vectors of samples to be estimated
% model: the trained SVM model
% thrs: threshold for dividing, default as 0
%
% outputs
% plabel: the estimated labels
%
% Date: 2018/03/05
% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>

if nargin < 4
    thrs = 0;
end

if (model.Parameters(2) == 2)
    gamma = model.Parameters(4);
    kerfun = @(u,v)(exp(-gamma.*sum((u-v).^2)));
elseif (model.Parameters(2) == 0)
    kerfun = @(u,v)(u*v');
end

% Init
nSV = model.nSV; 
y = zeros(size(x,1),1);

for i = 1 : size(x,1)
    for n = 1:nSV
        u = model.SVs(i,:);
        y(n) = y(n) + model.sv_coef(i) * kerfun(u,x(i));
    end
    b = -model.rho;
    y(n) = y(n) + b;
    if y >= thrs
        plabel = 1;
    else
        plabel = -1;
    end
end
