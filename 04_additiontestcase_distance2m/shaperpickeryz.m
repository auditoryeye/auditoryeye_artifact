function [shapestring] = shaperpickeryz(key_number)

    marker = ["o","^",">","o","pentagram","square","<","o","diamond","square","^","square","+","v","hexagram"];
    
    totalsize = length(marker);
    
    number1 = mod(key_number-1,totalsize)+1;

    shapestring = marker{number1};
    
end

