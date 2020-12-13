function [mat] = extract_data_TLC_modes_2_vec(path)
    a = readtable(path);
    rawDataMat = table2array(a);
    [ rows, ~ ] = size(rawDataMat);
    %removing first column with cycle index
    rawDataMat(:, 1) = [];
        
    number_of_modes = 8;
    first_column = 1154;
    mat_m = zeros(number_of_modes, number_of_modes);
    mat_max = zeros(number_of_modes*number_of_modes,3);
    for i = 1:number_of_modes
        for j = 1:number_of_modes
            if i == j
                mat_m(i, j) = 0;
            else
                for col = first_column:56:11850
                    for row = 1:rows
                        mat_m(i, j) = mat_m(i, j) + rawDataMat(row, col);
                        
                    end
                end
                mat_max(i+j-1,1) = i;
                mat_max(i+j-1,2) = j;
                mat_max(i+j-1,3) = mat_m(i, j);
                %mat_m(row, 1) = mat_m(row, 1) / (192*8*18336);
                first_column = first_column + 1;
            end
        end
    end    
end
