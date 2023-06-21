function [trimmedname, roffset_back, loffset] = keynamecode(keyname)
    roffset = 0.0;
    loffset = 0.0;
    if keyname == '\'
            keyname = '\\';
    end
%     if keyname == 'm'
%             roffset = 3.0;
%     end
    if strlength(keyname)>4
        keyname = keyname(5:end);
        if strcmp(string(keyname),'backspace')
            keyname = 'Backs';
            keyname = char(0x2190);
        end
        if strcmp(string(keyname),'shift')
            keyname = 'LShift';
            %keyname = char(383);
            keyname = char(645);
            %keyname =  sprintf(' %s',keyname);
            roffset = -0.6;
            loffset = -0.8;
        end
        if strcmp(string(keyname),'shift_r')
            keyname = 'RShift';
            keyname = char(645);
            %keyname =  sprintf(' %s',keyname);
            roffset = -0.6;
            loffset = -0.8;
        end
        if strcmp(string(keyname),'tab')
            keyname = 'Tab';
            keyname = char(356);
        end
        if strcmp(string(keyname),'caps_lock')
            keyname = 'Cap';
            keyname = char(268);
        end
        if strcmp(string(keyname),'enter')
            keyname = 'Enter';
            keyname = char(0x21B2);
            roffset = 1.2;
        end
        if strcmp(string(keyname),'space')
            %keyname = 'Space';
            keyname = char(2190);
            loffset = 0.7;
        end
    else
        % to lower case
        keyname = lower(keyname);
    end
    trimmedname = keyname;
    roffset_back = roffset;
end

