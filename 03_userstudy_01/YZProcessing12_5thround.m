
%% Initialization
clear;
clc;

preround = 4;
thisround = 5;
samplerate_increase_factor = 5; %compared to last round
interpolation_type = 'linear';
rere_inter_factor = 50; %compared to 44100*10*4 Hz
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
Py = preref_M{2,2};
Rx = preref_M{2,3};
Ry = preref_M{2,4};

%%

kk = 1;
readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
[y,Fs] = audioread(readfilePath1); 

PxN = round(Px*Fs/1000000);
PyN = round(Py*Fs/1000000);
RxN = Rx*Fs/1000000;
RyN = Ry*Fs/1000000;


%%
%read previous round tdoa
 
PreTdoaFileID = fopen(PreTdoaPath);
PreTdoa_M = textscan(PreTdoaFileID, '%d %s %d %d');
fclose(PreTdoaFileID);
Pretdoaarray = PreTdoa_M{3};
Pretdoa_v_array = PreTdoa_M{4};

%%

tdoa_M = zeros(keys_total,1);
tdoa_M_v = zeros(keys_total,1);

cali_range = max(RxN/13, RyN/4)*0.02;
cali_range_x = round(cali_range*samplerate_increase_factor);
cali_range_y = round(cali_range*samplerate_increase_factor);

parfor kk = 1:keys_total
        cc = 1;
        readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
        [y,Fs] = audioread(readfilePath1); 


        y1 = y(:,5);
        y2 = y(:,2);
        y3 = y(:,1);
        y4 = y(:,3);
            

        y1 = y1';
        y2 = y2';
        y3 = y3';
        y4 = y4';

        % align based on previous round's tdoa
        pre_tdoa = Pretdoaarray(kk);
        pre_tdoaN = pre_tdoa;
        %pre_tdoaN = round(pre_tdoa*Fs/1000000);
        pre_tdoav = Pretdoa_v_array(kk);
        pre_tdoavN = pre_tdoav;
        %pre_tdoavN = round(pre_tdoav*Fs/1000000);
        
        if pre_tdoaN > 0
            y1 = [y1 zeros(1,pre_tdoaN)];
            y2 = [zeros(1,pre_tdoaN) y2];
        elseif pre_tdoaN < 0
            y1 = [zeros(1,-pre_tdoaN) y1];
            y2 = [y2 zeros(1, -pre_tdoaN)];   
        end
        % align 2nd pair
        if pre_tdoavN > 0
            y3 = [y3 zeros(1,pre_tdoavN)];
            y4 = [zeros(1,pre_tdoavN) y4];
        elseif pre_tdoavN < 0
            y3 = [zeros(1,-pre_tdoavN) y3];
            y4 = [y4 zeros(1, -pre_tdoavN)];   
        end

        y1 = y1';
        y2 = y2';
        y3 = y3';
        y4 = y4';



        % selection based on the energy
        window = 5000;
        %mask = ones(1,window)/window;
        mask = hann(window);
        
        y_sum = y1+y2;
        y_sum1 = filter1('lp',y_sum,'fs',Fs,'fc',4000,'order',3); 
        y_sum2 = filter1('hp',y_sum,'fs',Fs,'fc',4000,'order',3);             
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

        [M1,I1] = max(Y_energy_conv1);
        [M2,I2] = max(Y_energy_conv2);
        
        
        [M_feet1, I_feet1] = findknee(Y_energy_conv1, M1, I1);
        [M_feet2, I_feet2] = findknee(Y_energy_conv2, M2, I2);
        
        I = min(I1,I2);
        trun_end = I;
        trun_start = min(I_feet1,I_feet2);
        
        y1 = filter1('hp',y1,'fs',Fs,'fc',4000,'order',3); 
        y2 = filter1('hp',y2,'fs',Fs,'fc',4000,'order',3); 
        
        y1 = y1(trun_start:trun_end);
        y2 = y2(trun_start:trun_end);
        
        %interpolate
        rere_fs = rere_inter_factor*Fs;
        x = y1;
        xlen = length(x);                   
        t = (0:xlen-1)/Fs; 
        Resamples = 0:rere_fs*t(end);
        tResampled = Resamples/rere_fs;
        xLinear = interp1(t,x,tResampled, interpolation_type);
        y1 = xLinear;
        
        x = y2;
        xlen = length(x);                   
        t = (0:xlen-1)/Fs; 
        Resamples = 0:rere_fs*t(end);
        tResampled = Resamples/rere_fs;
        xLinear = interp1(t,x,tResampled, interpolation_type);
        y2 = xLinear;
        
%         
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





        y_sum = y3+y4;
        y_sum1 = filter1('lp',y_sum,'fs',Fs,'fc',4000,'order',3); 
        y_sum2 = filter1('hp',y_sum,'fs',Fs,'fc',4000,'order',3);             
        y_energy1 = y_sum1.^2;
        Y_energy_conv1 = conv(y_energy1, mask, 'same');
        y_energy2 = y_sum2.^2;
        Y_energy_conv2 = conv(y_energy2, mask, 'same');

        Y_energy_conv = Y_energy_conv2;
        
        
        [M1,I1] = max(Y_energy_conv1);
        [M2,I2] = max(Y_energy_conv2);
        [M_feet1, I_feet1] = findknee(Y_energy_conv1, M1, I1);
        [M_feet2, I_feet2] = findknee(Y_energy_conv2, M2, I2);
        
        I = min(I1,I2);
        %I = round(((I1+I2)/2 + min(I1,I2))/2);
        trun_end = I;
        %trun_start = trun_end - round(Fs/200);
        %trun_start = round((I_feet1+I_feet2)/2.0);
        trun_start = min(I_feet1,I_feet2);
        
        y3 = filter1('hp',y3,'fs',Fs,'fc',4000,'order',3); 
        y4 = filter1('hp',y4,'fs',Fs,'fc',4000,'order',3); 
        
        y3 = y3(trun_start:trun_end);
        y4 = y4(trun_start:trun_end);
        
        %interpolate
        x = y3;
        xlen = length(x);                   
        t = (0:xlen-1)/Fs; 
        Resamples = 0:rere_fs*t(end);
        tResampled = Resamples/rere_fs;
        xLinear = interp1(t,x,tResampled, interpolation_type);
        y3 = xLinear;
        
        x = y4;
        xlen = length(x);                   
        t = (0:xlen-1)/Fs; 
        Resamples = 0:rere_fs*t(end);
        tResampled = Resamples/rere_fs;
        xLinear = interp1(t,x,tResampled, interpolation_type);
        y4 = xLinear;
        


        %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
        [cc_result,lags] = xcorr(y1,y2, cali_range_x);
        [tau_max, lag_index] = max(cc_result);
        %unit: samples
        time_difference = lags(lag_index);
        tdoa_M(kk) = time_difference;

        %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
        [cc_result,lags] = xcorr(y3,y4, cali_range_y);
        [tau_max, lag_index] = max(cc_result);
        %unit: samples
        time_difference_v = lags(lag_index);
        tdoa_M_v(kk) = time_difference_v;

        if (visualize == 1)
            figure;
            subplot(2,1,1);
            hold on;
            plot(y1);
            plot(y2);
            subplot(2,1,2);
            hold on;
            time_difference
            if time_difference > 0
                y111 = [y1 zeros(1,time_difference)];
                y222 = [zeros(1,time_difference) y2];
            elseif time_difference < 0
                y111 = [zeros(1,-time_difference) y1];
                y222 = [y2 zeros(1, -time_difference)];   
            end
            plot(y111);
            plot(y222);
            
            
            
            figure;
            subplot(2,1,1);
            hold on;
            plot(y3);
            plot(y4);
            subplot(2,1,2);
            hold on;
            time_difference_v
            if time_difference_v > 0
                y333 = [y3 zeros(1,time_difference)];
                y444 = [zeros(1,time_difference) y4];
            elseif time_difference < 0
                y333 = [zeros(1,-time_difference) y3];
                y444 = [y4 zeros(1, -time_difference)];   
            end
            plot(y333);
            plot(y444);
            
            
        end
end

%%

% re align


if (visualize == 0)
    tdoa_output_Path = sprintf('%s/keys_tdoa_cali%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk), tdoa_M_v(kk));
    end  
    fclose(fileID);


    tdoa_M = tdoa_M + double(Pretdoaarray)*samplerate_increase_factor;
    tdoa_M_v = tdoa_M_v + double(Pretdoa_v_array)*samplerate_increase_factor;

    tdoa_output_Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk), tdoa_M_v(kk));
    end  
    fclose(fileID);



end


