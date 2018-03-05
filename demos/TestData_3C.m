% Copyright (C) 2018 Zhixian MA <zx@mazhixian.me>
% Generate the test set and corresponding label: three-class

VerSize = 100;
HorSize = 100;
NumTest = 30;

TestSet = [VerSize*rand(NumTest,1),HorSize*rand(NumTest,1)];
TestLabel = zeros(NumTest,1);

for i = 1 : NumTest
    if(TestSet(i,1)<=50 && TestSet(i,2) <= 50)     
        TestLabel(i) = 1;
    elseif(TestSet(i,1)<=50 && TestSet(i,2) > 50)     
        TestLabel(i) = 2;
    elseif(TestSet(i,1)>=50)     
        TestLabel(i) = 3;
    end
end
