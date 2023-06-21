
%% Initialization
clear;
clc;

preround = 2;
thisround = 3;

visualize = 0;
ss = 1;
savefoldername = sprintf('recording%d_keys_interpolated',ss);
referencepoints_input_path = sprintf('%s/keys_tdoa%d_reference.txt',savefoldername,preround-1);
PreTdoaPath = sprintf('%s/keys_tdoa%d.txt',savefoldername,preround-1);

% read description
KeysGroundTruthPath = sprintf('%s/keys_groundtruth.txt',savefoldername);
KeyRecord_M = readcell(KeysGroundTruthPath, 'Delimiter',' ');
keys_total = length(KeyRecord_M(:,1));


% read recorded keys
AudioDescPath = sprintf('recording%d_clicks.csv',1);
%KeyRecord_M = readtable(KeyRecordPath, 'VariableNamingRule', 'preserve');
preref_M = readcell(referencepoints_input_path, 'Delimiter',' ');
%preref_M = preref_M(2,:);

Px = preref_M{2,1};
Rx = preref_M{2,2};

%%

kk = 1;
readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
[y,Fs] = audioread(readfilePath1); 

PxN = round(Px*Fs/1000000);
RxN = Rx*Fs/1000000;

RxN = round(RxN * 1);
%RxN = round(RxN * 1);


%%
%read previous round tdoa
 
PreTdoaFileID = fopen(PreTdoaPath);
PreTdoa_M = textscan(PreTdoaFileID, '%d %s %d');
fclose(PreTdoaFileID);
Pretdoaarray = PreTdoa_M{3};

%%

tdoa_M = zeros(keys_total,1);

cali_range_x = round(RxN);

parfor kk = 1:keys_total
        cc = 1;
        readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
        [y,Fs] = audioread(readfilePath1); 


        y1 = y(:,2);
        y2 = y(:,1);
            
        y1 = y1';
        y2 = y2';

        pre_tdoa = Pretdoaarray(kk);
        pre_tdoaN = pre_tdoa;
        
        if pre_tdoaN > 0
            y1 = [y1 zeros(1,pre_tdoaN)];
            y2 = [zeros(1,pre_tdoaN) y2];
        elseif pre_tdoaN < 0
            y1 = [zeros(1,-pre_tdoaN) y1];
            y2 = [y2 zeros(1, -pre_tdoaN)];   
        end
        y1 = y1';
        y2 = y2';


        % selection based on the energy
        window =5000;
        mask2 = ones(1,window)/window;
        mask = hann(window);
        
        y_sum = y1+y2;
        y_sum1 = filter1('lp',y_sum,'fs',Fs,'fc',3000,'order',3); 
        y_sum2 = filter1('hp',y_sum,'fs',Fs,'fc',3000,'order',3);             
        y_energy1 = y_sum1.^2;
        Y_energy_conv1 = conv(y_energy1, mask, 'same');
        y_energy2 = y_sum2.^2;
        Y_energy_conv2 = conv(y_energy2, mask, 'same');

        if (visualize == 1)
            f = figure;
            f.Position = [200 250 560 420];
            hold on;
            subplot(3,1,1);
            plot(y_sum);
            subplot(3,1,2);
            plot(y_sum1);
            legend('Low Frequency Signals');
            subplot(3,1,3);
            plot(y_sum2);
            legend('High Frequency Signals');

            figure;
            hold on;
            subplot(3,1,1);
            plot(y_sum);
            ylabel('Sample Value');
            subplot(3,1,2);
            plot(Y_energy_conv1);
            legend('Energy of Low Frequency Signals');
            ylabel('Energy');
            subplot(3,1,3);
            plot(Y_energy_conv2);
            legend('Energy of High Frequency Signals');
            ylabel('Energy');
            xlabel('Sample Index (Unit: 1/441000 s)');
        end

        %y1 = y(20500:21800,2);
        %y2 = y(20500:21800,4);
        %y3 = y(20500:21800,3);
        %y4 = y(20500:21800,6);
        %Y_energy_conv = Y_energy_conv1;
        [M1,I1] = max(Y_energy_conv1);
        [M2,I2] = max(Y_energy_conv2);
        I = min(I1,I2);
        %by 2 for mssl
        %I = (max(I1,I2)-min(I1,I2))*0.5 + min(I1,I2);
        trun_end = I;
        %trun_start = trun_end - round(Fs/200);
        trun_start = 1;
        
        
%         y1_hpf = filter1('hp',y1,'fs',Fs,'fc',3000,'order',3); 
%         y2_hpf = filter1('hp',y2,'fs',Fs,'fc',3000,'order',3);   
%         y1 = y1_hpf(trun_start:trun_end);
%         y2 = y2_hpf(trun_start:trun_end);
        
        y1 = y1(trun_start:trun_end);
        y2 = y2(trun_start:trun_end);
        
        if (visualize == 1)
            figure;
            subplot(3,1,1);
            hold on;
            plot(y_sum);
            xline(trun_end);
            xline(trun_start);
            subplot(3,1,2);
            plot(y_sum(trun_start:trun_end));
            subplot(3,1,3);
            hold on;
            plot(y1);
            plot(y2);
        end




        %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
        [cc_result,lags] = xcorr(y1,y2, cali_range_x);
        [tau_max, lag_index] = max(cc_result);
        %unit: samples
        time_difference = lags(lag_index);
   
        if ((time_difference+pre_tdoaN) > (PxN + RxN))
            time_difference+pre_tdoaN
            tmp_cali_range_x = PxN + RxN - pre_tdoaN;
            [cc_result,lags] = xcorr(y1,y2, tmp_cali_range_x);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            time_difference+pre_tdoaN
        elseif ((time_difference+pre_tdoaN) < (PxN - RxN))
            time_difference+pre_tdoaN
            tmp_cali_range_x = pre_tdoaN - PxN + RxN;
            [cc_result,lags] = xcorr(y1,y2, tmp_cali_range_x);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            time_difference+pre_tdoaN
        end
        
        tdoa_M(kk) = time_difference;


end

%%

% re align


if (visualize == 0)
    tdoa_output_Path = sprintf('%s/keys_tdoa_cali%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk));
    end  
    fclose(fileID);


    tdoa_M = tdoa_M + double(Pretdoaarray);

    tdoa_output_Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk));
    end  
    fclose(fileID);



end


