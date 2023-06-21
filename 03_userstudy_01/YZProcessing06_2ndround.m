
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

% 
% KeysRawTdoaFileID = fopen(KeysTdoa0Path);
% KeysRawTdoa_M = textscan(KeysRawTdoaFileID, '%d %s %d %d');
% 
% keys_total = length(KeysRawTdoa_M{:,1});
% tdoaarray = KeysRawTdoa_M{3};
% tdoa_v_array = KeysRawTdoa_M{4};
% indexarray = KeysRawTdoa_M{1};
% keycellarray = KeysRawTdoa_M{2};

% read previous references
%[Px, Py, range_x, range_y]

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

RxN = round(RxN * 1.05);
RyN = round(RyN * 1.05);

%%

tdoa_M = zeros(keys_total,1);
tdoa_M_v = zeros(keys_total,1);

if (visualize == 0)
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
            
            % align
            if PxN > 0
                y1 = [y1 zeros(1,PxN)];
                y2 = [zeros(1,PxN) y2];
            elseif PxN < 0
                y1 = [zeros(1,-PxN) y1];
                y2 = [y2 zeros(1, -PxN)];   
            end
            % align 2nd pair
            if PyN > 0
                y3 = [y3 zeros(1,PyN)];
                y4 = [zeros(1,PyN) y4];
            elseif PyN < 0
                y3 = [zeros(1,-PyN) y3];
                y4 = [y4 zeros(1, -PyN)];   
            end

            y1 = y1';
            y2 = y2';
            y3 = y3';
            y4 = y4';
            

            
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y1,y2, RxN);
            [tau_max, lag_index] = max(cc_result);
            %unit: samples
            time_difference = lags(lag_index);
            tdoa_M(kk) = time_difference;
            
            %[cc_result,lags] = xcorr(y1,y2,max_delay(ff));
            [cc_result,lags] = xcorr(y3,y4, RyN);
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


    tdoa_M = tdoa_M + PxN;
    tdoa_M_v = tdoa_M_v + PyN;

    tdoa_output_Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,thisround-1);
    fileID = fopen(tdoa_output_Path,'w');
    for kk = 1:keys_total
        fprintf(fileID,'%04d %s %d %d \n',kk, string(KeyRecord_M(kk,2)), tdoa_M(kk), tdoa_M_v(kk));
    end  
    fclose(fileID);



end


