function [mat_m] = extract_data_TLC_mode(rawDataMat,i,j)
    
    [ rows, ~ ] = size(rawDataMat);
    %removing first column with cycle index
    rawDataMat(:, 1) = [];
        
    first_column = 1154;
    if i < j
        first_column = first_column + (i*7) + (j-1);
    else
        first_column = first_column + (i*7) + j;
    end
    mat_m = zeros(rows,1);
    for row = 1:1:rows
        for col = first_column:56:11850
            mat_m(row,1) = mat_m(row, 1) + rawDataMat(row, col);
        end
    end
end
