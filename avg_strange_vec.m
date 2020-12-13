function [vec_strange_avg] = avg_strange_vec(vec1,vec2)
[ rows, ~ ] = size(vec1);    
for i = 1:rows
    vec_strange_avg(i,1) =  vec1(i,1);
    vec_strange_avg(i,2) =  vec1(i,2);
    vec_strange_avg(i,3) = (vec1(i,3) + vec2(i,3)) /2;
end
end

