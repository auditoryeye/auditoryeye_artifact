
%% Initialization
clear;
clc;

preround = 1;
thisround = 2;

visualize = 0;
ss = 1;
savefoldername = sprintf('recording%d_keys_interpolated',ss);
referencepoints_input_path = sprintf('%s/keys_tdoa%d_reference.txt',savefoldername,preround-1);
KeysTdoa0Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,preround-1);

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

RxN = round(RxN * 1.15);

%%

tdoa_M = zeros(keys_total,1);

if (visualize == 0)
    parfor kk = 1:keys_total
            cc = 1;
            readfilePath1 = sprintf('%s/key%04d.wav',savefoldername,kk);
            [y,Fs] = audioread(readfilePath1); 


            y1 = y(:,2);
            y2 = y(:,1);
            
            y1 = y1';
            y2 = y2';
            
            % align
            if PxN > 0
                y1 = [y1 zeros(1,PxN)];
                y2 = [zeros(1,PxN) y2];
            elseif PxN < 0
                y1 = [zeros(1,-PxN) y1];
                y2 = [y2 zeros(1, -PxN)];   
            end
            y1 = y1';
            y2 = y2';

            
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y1,y2, RxN);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            tdoa_M(kk) = time_difference;
            
            
    end
else

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


    tdoa_M = tdoa_M + PxN;

    tdoa_output_Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk));
    end  
    fclose(fileID);



end


