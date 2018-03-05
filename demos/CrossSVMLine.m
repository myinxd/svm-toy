% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% SVM training and test linear kernel
% Cross validation
clc
clear

%load DemoData2C
load DemoData
tic
c = -10:0.5:10;
m = size(c);
cg = zeros(m);
eps = 10^-4;
v = 5;
t = 0;
bestc = 1; bestg = 0.1; bestacc = 0;
for i = 1 : m
    cmd = ['-v ',num2str(v), ' -c ', num2str(2^c(i)), ' -t ', num2str(t)];
    cg(i) = svmtrain(TrainLabel,TrainSet,cmd);
    if (cg(i) > bestacc)
        bestacc = cg(i);
        bestc = 2^c(i);
    end
    if abs(cg(i) - bestacc) <= eps && bestc > 2^c(i)
            bestacc = cg(i);
            bestc = 2^c(i);
    end
    
end
cmd = ['-c ',num2str(bestc),' -t ', num2str(t)];
model = svmtrain(TrainLabel,TrainSet,cmd);

toc
