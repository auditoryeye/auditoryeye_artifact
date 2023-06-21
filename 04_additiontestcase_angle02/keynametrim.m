function [trimmedname] = keynametrim(keyname)
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
    trimmedname = keyname;
end

