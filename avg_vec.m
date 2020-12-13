function [avg_vec] = avg_vec(vec1,vec2)
    [ rows, ~ ] = size(vec1);
    avg_vec = zeros(rows,1);
    for row = 1:rows
        avg_vec(row,1) = (vec1(row,1) + vec2(row,1)) / 2;
    end 
end

