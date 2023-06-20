clc;
clear;

% meanx, stdx, minx, maxx, meany, stdy, miny, maxy
feature_total = 8;



key_names = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
    'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
    'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
    'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
    'Key.space'};


ss = 1;
%round = 1; unit_scale = 1000000/(441000*4);% microsecond
%round = 2; unit_scale = 1000000/(441000*4);% microsecond
%round = 4; unit_scale = 1000000/(441000*4*10);% microsecond
round = 5; unit_scale = 1000000/(441000*4*10*5);% microsecond



savefoldername = sprintf('recording%d_keys_interpolated',ss);
% read description
KeysTdoa0Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,round-1);
%KeysRawTdoa_M = readcell(KeysRawTdoaPath, 'Delimiter',' ');
KeysRawTdoaFileID = fopen(KeysTdoa0Path);
KeysRawTdoa_M = textscan(KeysRawTdoaFileID, '%d %s %d %d');

tdoaarray = KeysRawTdoa_M{3};
tdoa_v_array = KeysRawTdoa_M{4};
indexarray = KeysRawTdoa_M{1};
keycellarray = KeysRawTdoa_M{2};
totalLen = length(tdoaarray);


%sorting to make the same keys together
[sortedkeycellarray,I] = sort(keycellarray);
sortedkeycellarray  = string(sortedkeycellarray);

sortedtdoaarray =  tdoaarray(I);
sortedtdoa_v_array =  tdoa_v_array(I);

key_names_array = string(key_names);
C = categorical(sortedkeycellarray,key_names_array);
%C = reordercats(sortedkeycellarray,key_names);
C = reordercats(C,key_names_array);
% a total of Cats classes
Cats = categories(C);
% total number for each class
Cats_count = countcats(C);

%%

statistics = zeros(length(Cats_count),feature_total);

% calculate statistics
accumulateindex = 1;
for cccc = 1:length(Cats_count)
    selectindexes = (sortedkeycellarray == Cats{cccc});
    tdoaarray_tmp = double(sortedtdoaarray(selectindexes));
    tdoa_v_array_tmp = double(sortedtdoa_v_array(selectindexes));
    
    statistics(cccc,1) = mean(tdoaarray_tmp);
    statistics(cccc,2) = std(tdoaarray_tmp);
    statistics(cccc,3) = min(tdoaarray_tmp);
    statistics(cccc,4) = max(tdoaarray_tmp);
    
    statistics(cccc,5) = mean(tdoa_v_array_tmp);
    statistics(cccc,6) = std(tdoa_v_array_tmp);
    statistics(cccc,7) = min(tdoa_v_array_tmp);
    statistics(cccc,8) = max(tdoa_v_array_tmp);
end

% write
savefilePath = sprintf('%s/keys_tdoa%d_statistics.txt',savefoldername,round-1);
fileID = fopen(savefilePath,'w');
fprintf(fileID,'Px Py Rx Ry \n');
for cccc = 1:length(Cats_count)
    fprintf(fileID,'%.9f %.9f %.9f %.9f %.9f %.9f %.9f %.9f \n', statistics(cccc,1), statistics(cccc,2), statistics(cccc,3), statistics(cccc,4), statistics(cccc,5), statistics(cccc,6), statistics(cccc,7), statistics(cccc,8));
end
fclose(fileID);


%%

DistancesM = zeros(totalLen, length(Cats_count));
attempts = 7;
ResultsM = strings([totalLen, attempts]);
%Distances_v_M = zeros(totalLen, length(Cats_count));
parfor kk = 1:totalLen
    tdoaX = tdoaarray(kk);
    tdoaY = tdoa_v_array(kk);
    %probability for each
    DistancesM_row = zeros(length(Cats_count),1);
    for cccc = 1:length(Cats_count)
        tmp_meanX = statistics(cccc,1);
        tmp_meanY = statistics(cccc,5);
        DistancesM_row(cccc) =  pdist([tdoaX, tdoaY;tmp_meanX,tmp_meanY],'euclidean');
    end
    [mindistances, resultkeyclasses] = mink(DistancesM_row, attempts);
    resultkeynames = key_names_array(resultkeyclasses);
    resultkeynames = resultkeynames';
    ResultsM(kk,:) = resultkeynames;
    DistancesM(kk,:) = DistancesM_row;
end


%% 
%save to 

result_output_Path = sprintf('%s/keys_tdoa%d_results.txt',savefoldername,round-1);
fileID = fopen(result_output_Path,'w');


fprintf(fileID,'%-15s ', 'GroundTruth');
for aa = 1:attempts
    fprintf(fileID,'%d%-14s ', aa, 'attempt');
end
fprintf(fileID,' \n');



for kk = 1:totalLen
    fprintf(fileID,'%-15s ',keycellarray{kk});
    for aa = 1:attempts
        fprintf(fileID,'%-15s ',ResultsM(kk,aa));
    end
    fprintf(fileID,' \n');
end  
fclose(fileID);


%% accuracy
revealed = zeros(totalLen, 1);
accuracies = zeros(attempts,1);
for aa = 1:attempts
    for kk = 1:totalLen
        if (keycellarray{kk} == ResultsM(kk,aa))
            revealed(kk) = 1;
        end
    end
    aa
    accuracies(aa) = double(sum(revealed))/double(totalLen)
end  


resultac_output_Path = sprintf('%s/keys_tdoa%d_results_accuracy.txt',savefoldername,round-1);
fileID = fopen(resultac_output_Path,'w');


%fprintf(fileID,'Accuracy \n');
for aa = 1:attempts
    fprintf(fileID,'%0.16f \n', accuracies(aa));
end
fprintf(fileID,' \n');



fclose(fileID);