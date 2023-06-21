% Yazhou Tu <tuyazhou2016@gmail.com>
% Wireless and Embedded Device Security Lab
% Created: Jun. 20, 2021
% Modified: Dec. 11, 2022. 

%% Initialization
clear;
clc;

% microsecond
unit_scale = 1000000/(441000*4);

ss = 1;
round = 3;
savefoldername = sprintf('recording%d_keys_interpolated',ss);
%tdoa_output_Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,round-1);
referencepoints_output_path = sprintf('%s/keys_tdoa%d_reference.txt',savefoldername,round-1);


% read description
KeysTdoa0Path = sprintf('%s/keys_tdoa%d.txt',savefoldername,round-1);
%KeysRawTdoa_M = readcell(KeysRawTdoaPath, 'Delimiter',' ');
KeysRawTdoaFileID = fopen(KeysTdoa0Path);
KeysRawTdoa_M = textscan(KeysRawTdoaFileID, '%d %s %d');

totalLen = length(KeysRawTdoa_M(:,1));
tdoaarray = KeysRawTdoa_M{3};
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

%%



key_names = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
    'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
    'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
    'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
    'Key.space'};


f = figure;
hold on;
C = categorical(sortedkeycellarray,key_names);
scatter(C,sortedtdoaarray*unit_scale,'MarkerFaceColor','b','MarkerEdgeColor','b',...
    'MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1);
ylabel('\Delta T ({\mu}s)');
%yline(mean(sortedtdoaarray)*unit_scale,'r');
texttmp=sprintf('%.6f',mean(sortedtdoaarray*unit_scale));
%text(30,mean(sortedtdoaarray*unit_scale), texttmp, 'Color', 'r');

f.Position = [200 250 780 260];
%ylim([-10 10]);





%% remove outliers

%ylim([-10 10]);

[B1,I1] = rmoutliers(double(sortedtdoaarray));
%[B1,TFrm1,TFoutlier1,L1,U1,C1] = rmoutliers(sortedtdoaarray);
%yline([L1 U1 C1],":",["Lower Threshold","Upper Threshold","Center Value"])
C1 = C;
C1(I1) = [];

% f = figure;
% hold on;
% scatter(C1,B1*unit_scale,'MarkerFaceColor','b','MarkerEdgeColor','b',...
%     'MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1);
% f.Position = [200 250 780 260];
% ylabel('\Delta T ({\mu}s)');

Px = mean(B1*unit_scale);
%yline(Px,'r');
texttmp=sprintf('Px %.6f',Px);
%text(30,Px, texttmp, 'Color', 'r');

range_xh = max(B1)-mean(B1);
range_xl = mean(B1)-min(B1);
range_x = max([range_xh range_xl])*unit_scale;
texttmp=sprintf('Rx %.6f',range_x);
%text(30,Px*1.5, texttmp, 'Color', 'r');


%%
fileID = fopen(referencepoints_output_path,'w');
fprintf(fileID,'Px Rx \n');
fprintf(fileID,'%.9f %.9f \n', Px, range_x);
fclose(fileID);

