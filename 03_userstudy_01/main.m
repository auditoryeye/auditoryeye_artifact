% This code calculates the time delay measurements of 2909 keystroke sounds
% from unconstrained user inputs including passwords, IDs, addresses, GPS coordinates,
% real-world texts with capital letters, punctuation, ssh credentials, etc.


%% I-round 
% This line calculates the time delays using two pairs of microphones in
% the initial round 
run('YZProcessing04_tdoa.m');

%results
% This line identifies the outliers and illustrates the time delay results in the initial round
run('YZProcessing05_statistics_remoutlier.m');

%% B-round 
% This line calculates the time delays using two pairs of microphones in
% the B-round 
run('YZProcessing06_2ndround.m');
%results
% This line illustrates the time delay results in the B-Round
run('YZProcessing07_2ndroundstatistics.m');


%% T-round 
% This line calculates the time delays in the T-round 
run('YZProcessing08_3rdround.m');
%results
% This line illustrates the time delay results in the T-Round
run('YZProcessing09_3rdroundstatistics.m');

%% C-rounds 
% These lines calculate and illustrate the time delays in the C-round 
run('YZProcessing10_4thround.m');
run('YZProcessing11_4throundstatistics.m');
%%
run('YZProcessing12_5thround.m');
run('YZProcessing13_5throundstatistics.m');


%%
% This line calculates the accuracy of recovering user's unconstrained keystroke inputs
% The reproduced result is included in Table 3 and described in the paper 
% The detailed results are stored in the file: recording1_keys_interpolated/keys_tdoa4_results.txt 
run('Statistics_accuracy_calculation');
