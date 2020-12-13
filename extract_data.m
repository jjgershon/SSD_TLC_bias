%%%%% extract_data script %%%%%

function [mat] = extract_data(path, pageType)
    
    rawDataMat = table2array(readtable(path));
    [ rows, cols ] = size(rawDataMat);
    
    % LH - 2052, LHH - 2308
    if(cols < 2100)
        testType = 'Baseline'; % Cyc|Ltot|Htot
        rawDataMat(:, [1 2 3]) = [];
    else
        testType = 'LHH';      % Cyc|Ltot|H1tot|H2tot
        rawDataMat(:, [1 2 3 4]) = [];
    end
    
    if(strcmp(pageType, 'L'))
        mat = zeros(rows, 128);
        for row = 1:rows
            for col = 1:2:255 % Go through LOW's
                mat(row, (col+1)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
            end
        end
        
    elseif(strcmp(pageType, 'H1') == 1)
        mat = zeros(rows, 128);
        for row = 1:rows
            for col = 257:2:511 % Skip the LOW's and go through First HIGH's
                mat(row, (col+1-256)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
            end
        end
        
    elseif(strcmp(pageType, 'H2') == 1)
        mat = zeros(rows, 128);
        for row = 1:rows
            for col = 2049:2:2303 % Skip the LOW's, HIGH's & STATES and go through Second HIGH's
                mat(row, (col+1-2048)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
            end
        end
        
    elseif(strcmp(pageType, 'T') == 1)
        if(strcmp(testType, 'Baseline'))
            mat = zeros(rows, 256);
            for row = 1:rows
                for col = 1:2:511 % Go through LOW's & HIGH's
                    mat(row, (col+1)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
                end
            end
        else    % testType is 'LHH'
            mat = zeros(rows, 384);
            for row = 1:rows
                for col = 1:2:511 % Go through LOW's & HIGH's
                    mat(row, (col+1)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
                end
                for col = 2049:2:2303 % skip STATES, and go through Second HIGH's also
                    mat(row, (col+1-2048+512)/2) = rawDataMat(row, col) + rawDataMat(row, col+1);
                end
            end
        end
    else
        Disp('pageType not known!');
        exit(-1);
    end
end
    