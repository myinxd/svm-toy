% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% Randomly generate the training data
% Three-class case

clc
clear all

VerSize = 100;
HorSize = 100;

% Centre of each classifications
ClsCnt1 = [25,25]; Wid1 = [40,40]; ClsNum1 = 50; ClsLab1 = 1;
ClsCnt2 = [25,75]; Wid2 = [40,40]; ClsNum2 = 50; ClsLab2 = 2;
ClsCnt3 = [75,50]; Wid3 = [40,90]; ClsNum3 = 100; ClsLab3 = 3;

% Generate the data set
% Uniformly distribution
TrainSet1_data = [(ClsCnt1(1) - Wid1(1)/2) + Wid1(1)*rand(ClsNum1,1),(ClsCnt1(2) - Wid1(2)/2) + Wid1(2)*rand(ClsNum1,1)];
TrainSet1_label = ClsLab1 * ones(ClsNum1,1);

TrainSet2_data = [(ClsCnt2(1) - Wid2(1)/2) + Wid2(1)*rand(ClsNum2,1),(ClsCnt2(2) - Wid2(2)/2) + Wid2(2)*rand(ClsNum2,1)];
TrainSet2_label = ClsLab2 * ones(ClsNum2,1);

TrainSet3_data = [(ClsCnt3(1) - Wid3(1)/2) + Wid3(1)*rand(ClsNum3,1),(ClsCnt3(2) - Wid3(2)/2) + Wid3(2)*rand(ClsNum3,1)];
TrainSet3_label = ClsLab3 * ones(ClsNum3,1);

% Display the data set
figure
scatter(TrainSet1_data(:,1),TrainSet1_data(:,2),'ro','filled');
hold on
scatter(TrainSet2_data(:,1),TrainSet2_data(:,2),'bo','filled');
hold on
scatter(TrainSet3_data(:,1),TrainSet3_data(:,2),'ko','filled');

TrainSet   = [TrainSet1_data(1:end,:);TrainSet2_data(1:end,:);TrainSet3_data(1:end,:)];
TrainLabel = [TrainSet1_label(1:end);TrainSet2_label(1:end);TrainSet3_label(1:end)];

save DemoData TrainSet TrainLabel TrainSet1_data TrainSet2_data TrainSet3_data


