% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% SVM training and test
% Cross validation

clc
clear all

load DemoData2C
tic
[c,g] = meshgrid(-10:0.5:10,-10:0.2:10);
[m,n] = size(c);
cg = zeros(m,n);
eps = 10^-4;
v = 5;
bestc = 1; bestg = 0.1; bestacc = 0;
for i = 1 : m
    for j = 1 : n
        cmd = ['-v ',num2str(v), ' -c ', num2str(2^c(i,j)), ' -g ', num2str(2^g(i,j))];
        cg(i,j) = svmtrain(TrainLabel,TrainSet,cmd);
        if (cg(i,j) > bestacc)
            bestacc = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
        if abs(cg(i,j) - bestacc) <= eps && bestc > 2^c(i,j)
            bestacc = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
    end
end
%cmd = ['-s ',num2str(0),'-c ',num2str(10)]
%cmd = [];
cmd = ['-c ',num2str(bestc), ' -g ', num2str(bestg)];
model = svmtrain(TrainLabel,TrainSet,cmd);

VerSize = 100;
HorSize = 100;
NumTest = 50;
TestSet = [VerSize*rand(NumTest,1),HorSize*rand(NumTest,1)];
TestLabel = zeros(NumTest,1);

for i = 1 : NumTest
    if(-TestSet(i,2)+100 >= 50)     
        TestLabel(i) = -1;
    elseif(-TestSet(i,2) < 50)     
        TestLabel(i) = 1;
    end
end

[predicted_label, accuracy, decision_values]=svmpredict(TestLabel,TestSet,model);

scatter(TestSet(:,1),TestSet(:,2),'g^')
hold on

scatter(TrainSet1_data(:,1),TrainSet1_data(:,2),'ro','filled');
hold on
scatter(TrainSet2_data(:,1),TrainSet2_data(:,2),'bo','filled');

toc
