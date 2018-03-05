function [LineSV] = mySVMLineDraw(model,Class1,Class2,Itv,Err)
% function [LineSV] = mySVMLineDraw(model,Class1,Class2,Itv,Err)
% Draw the separate line
% model: generate from libsvm
% Class1, Class2: the two classifications
% Interval: the intervals of axes Itv = [xmin,xmax,ymin,ymax,stepx,stepy]
%
% Date: 2018/03/05
% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>

b = - model.rho((Class2-Class1)* Class1 + Class1-1);
x = Itv(1): Itv(5):Itv(2);
y = zeros(size(x));

if (model.Parameters(2) == 2)
    gamma = model.Parameters(4);
    FunKer = @(u,v)(exp(-gamma.*sum((u-v).^2)));
elseif (model.Parameters(2) == 0)
    FunKer = @(u,v)(u*v');
end

if nargin < 5
    Err = 1e-1;
end

SVs_total = full(model.SVs);
SVs = [SVs_total(sum(model.nSV(1:Class1-1))+1:sum(model.nSV(1:Class1)),:);SVs_total(sum(model.nSV(1:Class2-1))+1:sum(model.nSV(1:Class2)),:)];

SV_c = model.sv_coef;
SV_coef = [SV_c(sum(model.nSV(1:Class1-1))+1:sum(model.nSV(1:Class1)),Class2-1);SV_c(sum(model.nSV(1:Class2-1))+1:sum(model.nSV(1:Class2)),Class1)];

for i = 1 : length(x)
    for j = Itv(3):Itv(6):Itv(4)
        f = 0;
        for k = 1 : size(SVs,1)
            u = SVs(k,:);
            x0 = [x(i),j];
            f = f + SV_coef(k)*FunKer(u,x0);
        end
        f = f + b;
        if (abs(f - 0) <= Err)
            y(i) = j;
        end
    end
end

LineSV = [x',y'];    