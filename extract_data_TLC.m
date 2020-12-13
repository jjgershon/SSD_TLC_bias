%%%%% extract_data script %%%%%

% L mod 3 = 0
% M mod 3 = 1
% H mod 3 = 2

function [mat] = extract_data_TLC(path, pageType)
    
    a = readtable(path, 'HeaderLines', 2);
    rawDataMat = table2array(a);
    %[ rows, ~ ] = size(rawDataMat);
    rows = 2000;
    %removing first column with cycle index
    rawDataMat(:, 1) = [];
        
    mat_cols = 1;
    
    %Low
    if(strcmp(pageType, 'L'))
        mat = zeros(rows, mat_cols);
        for row = 1:rows
           
            for col = 2:6:1150
                mat(row, 1) = mat(row, 1) + rawDataMat(row, col) + rawDataMat(row, col+1);
                %index = index+1;
            end
            mat(row, 1) = mat(row, 1) / (192*8*18336);
        end
    elseif (strcmp(pageType, 'M'))
        %M
        mat = zeros(rows, mat_cols);
        for row = 1:rows
            for col = 4:6:1152 
                mat(row, 1) = mat(row, 1) + rawDataMat(row, col) + rawDataMat(row, col+1);
            end
            mat(row, 1) = mat(row, 1) / (192*8*18336);
        end
    elseif (strcmp(pageType, 'H'))    
        %H
        mat = zeros(rows, mat_cols);
        for row = 1:rows
            for col = 6:6:1154 
                mat(row, 1) = mat(row, 1) + rawDataMat(row, col) + rawDataMat(row, col+1);
            end
            mat(row, 1) = mat(row, 1) / (192*8*18336);
        end
    elseif (strcmp(pageType, 'T'))
        %Total
        mat = zeros(rows, 1);
            for row = 1:rows
                mat(row,1) = rawDataMat(row, 1) / (576*8*18336);
            end
    end
end
    

