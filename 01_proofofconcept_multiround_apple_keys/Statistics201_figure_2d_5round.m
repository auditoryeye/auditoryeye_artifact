% testing

%% Initialization
clear;
clc;

% microsecond
unit_scale = 1000000/(441000*4*10*5);





key_names = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
    'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
    'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
    'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
    'Key.space'};


ss = 1;
round = 5;
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
keystringarray = string(keycellarray);
totalLen = length(tdoaarray);

%sort first % then plot by category

f=figure;

f.Position = [200 250 780 260];
hold on;
box on;
for kkcc = 1:length(key_names)
    %x_index = double(tdoaarray(kkcc))*unit_scale;
    %y_index = double(tdoa_v_array(kkcc))*unit_scale;
    x_indexes = tdoaarray(keystringarray == key_names{kkcc});
    x_tdoas = double(x_indexes)*unit_scale;
    y_indexes = tdoa_v_array(keystringarray == key_names{kkcc});
    y_tdoas = double(y_indexes)*unit_scale;
    
    scatter(x_tdoas,y_tdoas,20,shaperpickeryz(kkcc),'MarkerEdgeColor',colorpickeryz(kkcc),...
          'MarkerFaceColor',colorpickeryz(kkcc),...
          'MarkerFaceAlpha',.4,'MarkerEdgeAlpha',0.9);
    keyname = key_names{kkcc};
    if keyname == '\'
        keyname = '\\';
    end
    if strlength(keyname)>4
        keyname = keyname(5:end);
        if strcmp(string(keyname),'backspace')
            keyname = 'Backs';
        end
        if strcmp(string(keyname),'shift')
            keyname = 'LShift';
        end
        if strcmp(string(keyname),'shift_r')
            keyname = 'RShift';
        end
        if strcmp(string(keyname),'tab')
            keyname = 'Tab';
        end
        if strcmp(string(keyname),'caps_lock')
            keyname = 'Cap';
        end
        if strcmp(string(keyname),'enter')
            keyname = 'Enter';
        end
        if strcmp(string(keyname),'space')
            keyname = 'Space';
        end
    end
    keynames_revised{kkcc} = keyname;
    %label_label = sprintf('%d(%s)',kk,keyname);
    label_label = sprintf('%s',keyname);
    %random_deviation = 0.1;
    text(mean(x_tdoas),mean(y_tdoas),label_label,'FontSize',18,'Color',colorpickeryz(kkcc)*0.5,'FontWeight', 'bold', 'HorizontalAlignment', 'center','VerticalAlignment', 'middle');

%    for kk = 1:length(x_tdoas)
        %text(x_tdoas(kk)+rand*random_deviation,y_tdoas(kk)+rand*random_deviation,label_label,'FontSize',11,'Color',colorpickeryz(kkcc)*0.3);
%    end
    %text(tdoaarray(kk)+rand*0.1,tdoa_v_array(kk)+3+rand*0.1,label_label,'FontSize',14,'Color',colorpickeryz(kk)*0.3);
    %text(x_tdoas,y_tdoas,label_label,'FontSize',12,'Color',colorpickeryz(kkcc)*0.3);

end

xlimstart = double(min(tdoaarray))*unit_scale*0.9999
xlimend = double(max(tdoaarray))*unit_scale*1.0001
ylimstart = double(min(tdoa_v_array))*unit_scale*0.9999
ylimend = double(max(tdoa_v_array))*unit_scale*1.0001

xlim([xlimstart, xlimend]);
ylim([ylimstart ylimend]);
xlabel('{\Delta}T_1({\mu}s)');
ylabel('{\Delta}T_2({\mu}s)');


