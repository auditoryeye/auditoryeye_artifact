% Yazhou Tu <tuyazhou2016@gmail.com>
% Wireless and Embedded Device Security Lab
% Created: Jun. 20, 2021
% Modified: Dec. 11, 2022. 
% This program computes the coarse-grained tdoa for comparison

%% Initialization
clear;
clc;

% statistics by keys, and show histogram (This step should be a generalized function, it receives inputs as the file path of tdoa result)



ss = 1;
interpolation_type = 'spline';
savefoldername = sprintf('recording%d_keys_interpolated_%s',ss,interpolation_type);
tdoa_output_Path = sprintf('%s/keys_tdoa0.txt',savefoldername);



% read description
KeysTdoa0Path = sprintf('%s/keys_tdoa0.txt',savefoldername);
%KeysRawTdoa_M = readcell(KeysRawTdoaPath, 'Delimiter',' ');
KeysRawTdoaFileID = fopen(KeysTdoa0Path);
KeysRawTdoa_M = textscan(KeysRawTdoaFileID, '%d %s %d %d');

totalLen = length(KeysRawTdoa_M(:,1));
tdoaarray = KeysRawTdoa_M{3};
tdoa_v_array = KeysRawTdoa_M{4};
indexarray = KeysRawTdoa_M{1};
keycellarray = KeysRawTdoa_M{2};

%zeros(totalLen,1);
%indexarray = zeros(totalLen,1);
%keycellarray = cell(totalLen,1);

% for k=1:length(KeysRawTdoa_M(:,1))
%     tdoa_tmp = KeysRawTdoa_M{k,3};
%     keystring_tmp = char(KeysRawTdoa_M(k,2));
%     index_tmp = KeysRawTdoa_M{k,1};
%     
%     keycellarray(k) = {keystring_tmp};
%     tdoaarray(k) = tdoa_tmp;
%     indexarray(k) = index_tmp;
% end



[sortedkeycellarray,I] = sort(keycellarray);
sortedtdoaarray =  tdoaarray(I);
sortedtdoa_v_array =  tdoa_v_array(I);

%%



key_names = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
    'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
    'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
    'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
    'Key.space'};


f = figure;
hold on;
C = categorical(sortedkeycellarray,key_names);
scatter(C,sortedtdoaarray,'MarkerFaceColor','b','MarkerEdgeColor','b',...
    'MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1);

f.Position = [200 250 780 260];
ylim([-10 10]);


%%



key_names = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
    'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
    'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
    'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
    'Key.space'};


f = figure;
hold on;
C = categorical(sortedkeycellarray,key_names);
scatter(C,sortedtdoa_v_array,'MarkerFaceColor','b','MarkerEdgeColor','b',...
    'MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1);

f.Position = [200 250 780 260];
ylim([-28 -13]);


%%
% 
% h = histogram(x)
% edgewidth = 30;
% Legend=cell(10,1);
% hs = zeros(edgewidth*2,10);
% edges = -edgewidth:1:edgewidth;
% 
% 
% statistics = zeros(feature_total,statisticsfeature_total);
% 
% 
% htmp = histcounts(tdoa_M(:,ff),edges);
% hs(:,countcount) = htmp;
