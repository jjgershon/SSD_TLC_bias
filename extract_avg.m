function [mat] = extract_avg(rows,path1, path2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

a = readtable(path1, 'HeaderLines', 2);
rawDataMat1 = table2array(a);
%removing first column with cycle index
rawDataMat1(:, 1) = [];
    
b = readtable(path2, 'HeaderLines', 2);
rawDataMat2 = table2array(b);
%removing first column with cycle index
rawDataMat2(:, 1) = [];

%Total
mat = zeros(rows, 1);
    for row = 1:rows
        mat(row,1) = (rawDataMat2(row, 1) + rawDataMat1(row, 1) ) / (2*576*8*18336);
    end
end

