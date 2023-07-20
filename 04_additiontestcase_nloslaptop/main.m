% This code evaluates the attack using laptop microphones in NLOS setting

%% I-round 
% This line calculates the time delays using one pair of microphones in
% the initial round
run('YZProcessing04_tdoa.m');

%results
% This line identifies the outliers and illustrates the time delay results in the initial round
% The reproduced result is included in Figure 21 top and described in the paper 
run('YZProcessing05_statistics_remoutlier.m');


%% B-round 
% This line calculates the time delays using one pair of microphones in
% the B-round 
run('YZProcessing06_2ndround.m');

%results
% This line illustrates the time delay results in the B-Round
% The reproduced result is included in Figure 21 middle and described in the paper 
run('YZProcessing07_2ndroundstatistics.m');



%% T-round 
% This line calculates the time delays in the T-round 
run('YZProcessing08_3rdround.m');

%results
% This line illustrates the time delay results in the T-Round
run('YZProcessing09_3rdroundstatistics.m');


%% C-rounds 
% Thess lines calculate and illustrate the time delays in the T-round 
run('YZProcessing10_4thround.m');
run('YZProcessing11_4throundstatistics.m');
%%
run('YZProcessing12_5thround.m');
% The reproduced result is included in Figure 21 bottom and described in the paper 
run('YZProcessing13_5throundstatistics.m');


%%
% This line calculates the accuracy of keystroke recoverery
run('Statistics_accuracy_calculation');