% Yazhou Tu <tuyazhou2016@gmail.com>
% Wireless and Embedded Device Security Lab
% Created: Jun. 20, 2021
% Modified: Dec. 11, 2022. 

%% Initialization
clear;
clc;
% select section
ii = 1;
% select filter
filter_select = 0;
filter_para = [1000 4000;
                1000 5000;
                2000 6000;
                3000 7000;
                4000 8000;
                5000 8000;
                6000 8000;
                7000 8000;
                7500 8000;
                7700 8000];

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
tdoa_M_v = zeros(keys_total,1);
tau_max_M = zeros(keys_total, 1);

if (visualize == 0)
    parfor kk = 1:keys_total
            cc = 1;
            readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
            [y,Fs] = audioread(readfilePath1); 

            y1 = y(:,5);
            y2 = y(:,1);
            y3 = y(:,6);
            y4 = y(:,3);
            
            if filter_select > 0
                y1 = filter1('hp',y1,'fs',Fs,'fc',filter_para(filter_select,1),'order',3); 
                y1 = filter1('lp',y1,'fs',Fs,'fc',filter_para(filter_select,2),'order',3);  
                y2 = filter1('hp',y2,'fs',Fs,'fc',filter_para(filter_select,1),'order',3); 
                y2 = filter1('lp',y2,'fs',Fs,'fc',filter_para(filter_select,2),'order',3);      
                y3 = filter1('hp',y3,'fs',Fs,'fc',filter_para(filter_select,1),'order',3); 
                y3 = filter1('lp',y3,'fs',Fs,'fc',filter_para(filter_select,2),'order',3);     
                y4 = filter1('hp',y4,'fs',Fs,'fc',filter_para(filter_select,1),'order',3); 
                y4 = filter1('lp',y4,'fs',Fs,'fc',filter_para(filter_select,2),'order',3);        
            end
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y1,y2, 800);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            tdoa_M(kk) = time_difference;
            tau_max_M(kk) = tau_max;
            
            
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y3,y4, 400);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference_v = lags(lag_index);
            tdoa_M_v(kk) = time_difference_v;
            
    end
else
    for kk = 1:keys_total
            cc = 1;
            readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
            [y,Fs] = audioread(readfilePath1); 

            y1 = y(:,2);
            y2 = y(:,4);
            
            y3 = y(:,3);
            y4 = y(:,6);
            
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y1,y2,100);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            kk
            string(KeyRecord_M(kk,2))
            time_difference = lags(lag_index)
            tdoa_M(kk) = time_difference;
            tau_max_M(kk) = tau_max;
            
            %visualize
            figure;
            subplot(2,1,1);
            hold on;
            plot(y1);
            plot(y2);
            xlim([20000 25000]);
            %xlim([2500 5500]);
            %align
            if time_difference >= 0
                tmp_y1 = y1(1+time_difference:end);
                tmp_y2 = y2(1:end-time_difference);
            else
                tmp_y1 = y1(1:end+time_difference);
                tmp_y2 = y2(1-time_difference:end);
            end
            
            subplot(2,1,2);
            hold on;
            plot(tmp_y1);
            plot(tmp_y2);
            xlim([20000 25000]);
            
            [cc_result,lags] = xcorr(y3,y4,30);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference_v = lags(lag_index)
            tdoa_M_v(kk) = time_difference_v;
            
            
            %visualize
            figure;
            subplot(2,1,1);
            hold on;
            plot(y3);
            plot(y4);
            %xlim([2000 6000]);
            %align
            if time_difference_v >= 0
                tmp_y3 = y3(1+time_difference_v:end);
                tmp_y4 = y4(1:end-time_difference_v);
            else
                tmp_y3 = y3(1:end+time_difference_v);
                tmp_y4 = y4(1-time_difference_v:end);
            end
            
            subplot(2,1,2);
            hold on;
            plot(tmp_y3);
            plot(tmp_y4);
            %xlim([2500 5500]);
 
    end
end

%%

if (visualize == 0)
    tdoa_output_Path = sprintf('%s/keys_tdoa0.txt',savefoldername);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk), tdoa_M_v(kk));
    end  
    fclose(fileID);


    tdoa_output_Path = sprintf('%s/keys_tdoa0_with_tau.txt',savefoldername);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d %0.16f \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk), tau_max_M(kk));
    end  
    fclose(fileID);

end
%% 3. statistics by keys, and show histogram (This step should be a generalized function, it receives inputs as the file path of tdoa result)
