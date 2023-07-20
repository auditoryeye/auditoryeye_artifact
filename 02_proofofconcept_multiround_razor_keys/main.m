% This code calculates the time delay measurements of 595 keystroke sounds
% from an Apple Magic Keyboard at about 0.5 distance.
% It can distinguish compactly spaced keys from a distance with an average standard deviations close to the microsecond-range in keystroke sound localization


%% I-round 
% This line calculates the time delays using two pairs of microphones in
% the initial round
run('YZProcessing04_tdoa.m');

%results
% This line identifies the outliers and illustrates the time delay results in the initial round
% The reproduced result is included and described in paper's Figure 12 top
run('YZProcessing05_statistics_remoutlier.m');
%% Illustration
% This line generates the 2D illustration of the keystroke localization measurements
% The reproduced result is included and described in paper's Figure 29  
run('Statistics201_figure_2d_1round.m');


%% B-round 
% This line calculates the time delays using two pairs of microphones in
% the B-round 
run('YZProcessing06_2ndround.m');

%results
% This line illustrates the time delay results in the B-Round
% The reproduced result is included and described in paper's Figure 12
% middle
run('YZProcessing07_2ndroundstatistics.m');

%% Illustration

% This line generates the 2D illustration of the keystroke localization measurements
% The reproduced result is included and described in paper's Figure 30  
run('Statistics201_figure_2d_2round.m');


%% T-round 
% This line calculates the time delays in the T-round 
run('YZProcessing08_3rdround.m');
%results
% This line illustrates the time delay results in the T-Round
% The reproduced result is included and described in paper's Figure 12
% bottom
run('YZProcessing09_3rdroundstatistics.m');

%% C-rounds 
% These lines calculate and illustrate the time delays in the C-round 
run('YZProcessing10_4thround.m');
run('YZProcessing11_4throundstatistics.m');
%%
run('YZProcessing12_5thround.m');
run('YZProcessing13_5throundstatistics.m');
%% statistics
% This line calculates the statistics of Final-round results
% The reproduced results is included in Table 2 and described in the paper
run('Statistics101_round5.m');

% This line generates the 2D illustration of the keystroke localization measurements
% The reproduced result is included and described in paper's Figure 31  
run('Statistics201_figure_2d_5round.m');


%%
% This line calculates the accuracy of recovering the keystroke inputs
% The reproduced result is included in Table 1 and described in the paper 
% The detailed results are stored in the file: recording1_keys_interpolated/keys_tdoa4_results.txt 
% More than 90% of the keystrokes are correctly identified in the first
% attempt
run('Statistics_accuracy_calculation');
