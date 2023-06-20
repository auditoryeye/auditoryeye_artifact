
%% I-round 
run('YZProcessing04_tdoa.m');
%results
run('YZProcessing05_statistics_remoutlier.m');
%% Illustration
%statistics
run('Statistics101_round1.m');
%2D illustration of the keystroke localization measurements
run('Statistics201_figure_2d_1round.m');


%% B-round 
run('YZProcessing06_2ndround.m');
%results
run('YZProcessing07_2ndroundstatistics.m');
%% Illustration
%statistics
run('Statistics101_round2.m');
%2D illustration of the keystroke localization measurements
run('Statistics201_figure_2d_2round.m');


%% T-round 
run('YZProcessing08_3rdround.m');
%results
run('YZProcessing09_3rdroundstatistics.m');
%% Illustration
%statistics
run('Statistics101_round3.m');


%% C-rounds 
run('YZProcessing10_4thround.m');
run('YZProcessing11_4throundstatistics.m');
%%
run('YZProcessing12_5thround.m');
run('YZProcessing13_5throundstatistics.m');
%% statistics
run('Statistics101_round5.m');
%2D illustration of the final-round keystroke localization measurements
run('Statistics201_figure_2d_5round.m');
%%
run('Statistics_accuracy_calculation');
