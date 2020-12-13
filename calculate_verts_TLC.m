

function [ percentile_errors_BER, total_errors_BER] = calculate_verts_TLC(Mat1, Mat2, Mat3, percentile,num_of_skips, PageType, page_size)

[iterations, num_of_pages] = size(Mat1);

irelevant_pages_num = 0;

relevant_pages_num  =  num_of_pages - irelevant_pages_num;

UniformQuantizationDelta = 20; %Taking the data of #UniformQuantizationDelta iterations

errors_per_p = zeros(UniformQuantizationDelta,num_of_pages*3);
percentile_errors(1:iterations) = 0;
total_errors(1:iterations) = 0;

for j = 1:UniformQuantizationDelta:(iterations-UniformQuantizationDelta);
    for i = j:1:j+UniformQuantizationDelta-1;
        errors_per_p(i-j+1,1:num_of_pages) = squeeze(Mat1(j,:));
        errors_per_p(i-j+1,num_of_pages+1:num_of_pages*2) = squeeze(Mat2(j,:));
        errors_per_p(i-j+1,1+(num_of_pages*2):num_of_pages*3) = squeeze(Mat3(j,:));
    end
    errors_per_p_sorted = sort(squeeze(reshape(errors_per_p,num_of_pages*3*UniformQuantizationDelta,1)));
    total_errors(j) = sum(errors_per_p_sorted);
    percentile_errors(j) = errors_per_p_sorted(floor((percentile*relevant_pages_num*3*UniformQuantizationDelta)+(irelevant_pages_num*3*UniformQuantizationDelta)));
end

percentile_errors_BER = percentile_errors/(page_size*8);
total_errors_BER      = total_errors/(page_size*8*relevant_pages_num*3*UniformQuantizationDelta);

end


