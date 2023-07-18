function [M_feet, I_feet] = findfeet(energy, M, I)
    feet_value = (M- min(energy))/100 + min(energy);
    tmp_i = I;
    
    while tmp_i > 1
        tmp_i = tmp_i - 1;
        if energy(tmp_i) <= feet_value
            break
        end
    end
    
    I_feet = tmp_i;
    M_feet = feet_value;
end

