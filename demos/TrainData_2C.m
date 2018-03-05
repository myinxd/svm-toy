% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% Randomly generate the training data
% Two-class case

clc
clear all

VerSize = 100;
HorSize = 100;

% Centre of each classifications
ClsCnt1 = [50,20]; Wid1 = [100,40]; ClsNum1 = 100; ClsLab1 = -1;
ClsCnt2 = [50,80]; Wid2 = [100,40]; ClsNum2 = 100; ClsLab2 = 1;

% Generate the data set
% Uniformly distribution
TrainSet1_data = [(ClsCnt1(1) - Wid1(1)/2) + Wid1(1)*rand(ClsNum1,1),(ClsCnt1(2) - Wid1(2)/2) + Wid1(2)*rand(ClsNum1,1)];
TrainSet1_label = ClsLab1 * ones(ClsNum1,1);

TrainSet2_data = [(ClsCnt2(1) - Wid2(1)/2) + Wid2(1)*rand(ClsNum2,1),(ClsCnt2(2) - Wid2(2)/2) + Wid2(2)*rand(ClsNum2,1)];
TrainSet2_label = ClsLab2 * ones(ClsNum2,1);

% Display the data set
figure
scatter(TrainSet1_data(:,1),TrainSet1_data(:,2),'ro','filled');
hold on
scatter(TrainSet2_data(:,1),TrainSet2_data(:,2),'bo','filled');
box on

TrainSet   = [TrainSet1_data(1:end,:);TrainSet2_data(1:end,:)];
TrainLabel = [TrainSet1_label(1:end);TrainSet2_label(1:end)];

save DemoData2C TrainSet TrainLabel TrainSet1_data TrainSet2_data
