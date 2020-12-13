function [vec_avg] = avg_mode(Input_1,Input_2,i,j)
vec_1 = extract_data_TLC_mode(Input_1,i,j);
vec_2 = extract_data_TLC_mode(Input_2,i,j);
vec_avg = avg_vec(vec_1,vec_2);
end

