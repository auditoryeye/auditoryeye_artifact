% Test Case at a specific distance (2m)

%% I-round 
% This line calculates the time delays using one pair of microphones in
% the initial round
run('YZProcessing04_tdoa.m');

%results
% This line identifies the outliers and illustrates the time delay results in the initial round
% The reproduced result is included in Figure 23 top and described in the paper 
run('YZProcessing05_statistics_remoutlier.m');

%% B-round 
% This line calculates the time delays using one pair of microphones in
% the B-round 
run('YZProcessing06_2ndround.m');

%results
% This line illustrates the time delay results in the B-Round
% The reproduced result is included in Figure 23 middle and described in the paper 
run('YZProcessing07_2ndroundstatistics.m');



%% T-round 
% This line calculates the time delays in the T-round 
run('YZProcessing08_3rdround.m');

%results
% This line illustrates the time delay results in the T-Round
% The reproduced result is included in Figure 23 bottom and described in the paper 
run('YZProcessing09_3rdroundstatistics.m');

%%
% This line calculates the statistics of keystroke sound localization
% The reproduced result is included in Figure 22 bottom and described in the paper 
run('Statistics101_round3.m');
