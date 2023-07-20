
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


%%
% This line calculates the keystroke recoverery accuracy
% The reproduced result is included in Table 6 and described in the paper 
run('Statistics_accuracy_calculation');
