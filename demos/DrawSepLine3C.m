% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% Draw sperate lines of 3 classfication

% Train the network
CrossSVMLine

% Get superplanes
LineSV12 = mySVMLineDraw(model,1,2,[0,50,0,100,0.5,0.5],1e-1);
LineSV13 = mySVMLineDraw(model,1,3,[0,100,0,50,0.5,0.5],1e-1);
LineSV23 = mySVMLineDraw(model,2,3,[0,100,50,100,0.5,0.5],1e-1);
 
% save Lines LineSV12 LineSV13 LineSV23 model

% Discard zero points
L12 = LineSV12(LineSV12(:,2) ~= 0, :);
L13 = LineSV13(LineSV13(:,2) ~= 0, :);
L23 = LineSV23(LineSV23(:,2) ~= 0, :);
 
% Draw results
gca = figure(1);
set(gca,'OuterPosition',[0 0 400 400])

plot(L12(:,1),L12(:,2),'linewidth',1.5);
hold on
plot(L13(:,1),L13(:,2),'linewidth',1.5);
hold on
plot(L23(:,1),L23(:,2),'linewidth',1.5);
legend('SP-12','SP-13','SP-23')
 
hold on 
mySVdraw(model,gca)
axis([0 100 0 100]);
box on