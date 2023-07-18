function [M_knee, I_knee] = findknee(energy, M, I)
    knee_value = (M- min(energy))/20 + min(energy);
    tmp_i = I;
    
    while tmp_i > 1
        tmp_i = tmp_i - 1;
        if energy(tmp_i) <= knee_value
            break
        end
    end
    
    I_knee = tmp_i;
    M_knee = knee_value;
end

