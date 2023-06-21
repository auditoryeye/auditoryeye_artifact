
%% I-round 
run('YZProcessing04_tdoa.m');
%results
run('YZProcessing05_statistics_remoutlier.m');

%% B-round 
run('YZProcessing06_2ndround.m');
%results
run('YZProcessing07_2ndroundstatistics.m');


%% T-round 
run('YZProcessing08_3rdround.m');
%results
run('YZProcessing09_3rdroundstatistics.m');


%% C-rounds 
run('YZProcessing10_4thround.m');
run('YZProcessing11_4throundstatistics.m');
%%
run('YZProcessing12_5thround.m');
run('YZProcessing13_5throundstatistics.m');
%%
run('Statistics_accuracy_calculation');