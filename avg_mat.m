function [avg_mat] = avg_mat(mat1,mat2)
[ rows, ~ ] = size(mat1);
cols = 8;
avg_mat = zeros(rows,cols);
    for row = 1:rows
        for col = 1:cols
            avg_mat(row,col) = (mat1(row,col) + mat2(row,col)) / 2;
        end
    end
end

