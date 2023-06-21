function [upperkeyname] = findupper(keyname)
    

    key_map1 = {'`';'1';'2';'3';'4';'5';'6';'7';'8';'9';'0';'-';'=';'Key.backspace';
        'Key.tab';'q';'w';'e';'r';'t';'y';'u';'i';'o';'p';'[';']';'\';
        'Key.caps_lock';'a';'s';'d';'f';'g';'h';'j';'k';'l';';';'''';'Key.enter';
        'Key.shift';'z';'x';'c';'v';'b';'n';'m';',';'.';'/';'Key.shift_r';
        'Key.space'};
    key_map1 = string(key_map1);

    key_map2 = {'~';'!';'@';'#';'$';'%';'^';'&';'*';'(';')';'_';'+';'Key.backspace';
        'Key.tab';'Q';'W';'E';'R';'T';'Y';'U';'I';'O';'P';'{';'}';'|';
        'Key.caps_lock';'A';'S';'D';'F';'G';'H';'J';'K';'L';':';'"';'Key.enter';
        'Key.shift';'Z';'X';'C';'V';'B';'N';'M';'<';'>';'?';'Key.shift_r';
        'Key.space'};

    key_map2 = string(key_map2);
    
    index = find(key_map1==keyname);
    upperkeyname = key_map2(index);

end

