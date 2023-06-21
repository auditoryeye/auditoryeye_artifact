% Yazhou Tu <tuyazhou2016@gmail.com>
% Wireless and Embedded Device Security Lab
% Created: Jun. 20, 2021
% Modified: Dec. 11, 2022. 

%% Initialization
clear;
clc;
% select section
ii = 1;
visualize = 0;

%% TODO
%% 1. Read keys description file.

savefoldername = sprintf('recording%d_keys_interpolated',ii);
% read description
KeysGroundTruthPath = sprintf('%s/keys_groundtruth.txt',savefoldername);
KeyRecord_M = readcell(KeysGroundTruthPath, 'Delimiter',' ');

keys_total = length(KeyRecord_M(:,1));

%% 2. 
% read each keystroke. 
% computer tdoas
% write tdoas to files
% visualize the computing and aligning

tdoa_M = zeros(keys_total,1);
tau_max_M = zeros(keys_total, 1);

if (visualize == 0)
    parfor kk = 1:keys_total
            cc = 1;
            readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
            [y,Fs] = audioread(readfilePath1); 

            y1 = y(:,2);
            y2 = y(:,1);
            
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y1,y2, 800);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            tdoa_M(kk) = time_difference;
            tau_max_M(kk) = tau_max;
            
            
    end
else
    
end

%%

if (visualize == 0)
    tdoa_output_Path = sprintf('%s/keys_tdoa0.txt',savefoldername);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk));
    end  
    fclose(fileID);



end