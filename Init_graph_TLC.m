%generate comparison graph for TLC
clear;clc;
close all;


%Output folder must end with '\'

Input_folder = 'C:\Users\ygershon\OneDrive - Intel Corporation\Documents\SSD_project\new_expr\';   %change here

Input_1 = strcat(Input_folder,'0280_Biased_20_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0281_Biased_20_3000.txt'); %change here
avg_test1 = extract_avg(3000,Input_1,Input_2);

Input_1 = strcat(Input_folder,'0282_Biased_22.5_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0283_Biased_22.5_3000.txt'); %change here
avg_test2 = extract_avg(3000,Input_1,Input_2);

Input_1 = strcat(Input_folder,'0263_Biased_22.5_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0266_Biased_22.5_3000.txt'); %change here
avg_test3 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0256_Biased_20_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0257_Biased_20_3000.txt'); %change here
% avg_test11 = extract_avg(3000,Input_1,Input_2);


% Input_1 = strcat(Input_folder,'0284_Biased_20_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0284_Biased_20_3000.txt'); %change here
% avg_test19 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0260_Biased_22.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0260_Biased_22.5_3000.txt'); %change here
% avg_test6 = extract_avg(3000,Input_1,Input_2);
% 
% Input_1 = strcat(Input_folder,'0269_Biased_20_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0269_Biased_20_3000.txt'); %change here
% avg_test7 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0270_Biased_17.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0270_Biased_17.5_3000.txt'); %change here
% avg_test8 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0274_Biased_17.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0279_Biased_17.5_3000.txt'); %change here
% avg_test14 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0275_Biased_17.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0275_Biased_17.5_3000.txt'); %change here
% avg_test15 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0276_Biased_17.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0276_Biased_17.5_3000.txt'); %change here
% avg_test16 = extract_avg(3000,Input_1,Input_2);
% 
% Input_1 = strcat(Input_folder,'0277_Biased_12.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0277_Biased_12.5_3000.txt'); %change here
% avg_test17 = extract_avg(3000,Input_1,Input_2);

Input_1 = strcat(Input_folder,'0278_Biased_18_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0278_Biased_18_3000.txt'); %change here
avg_test18 = extract_avg(3000,Input_1,Input_2);

Input_1 = strcat(Input_folder,'0285_Biased_19_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0286_Biased_19_3000.txt'); %change here
avg_test20 = extract_avg(3000,Input_1,Input_2);
% 
% Input_1 = strcat(Input_folder,'0271_Biased_22.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0271_Biased_22.5_3000.txt'); %change here
% avg_test9 = extract_avg(3000,Input_1,Input_2);

% Input_1 = strcat(Input_folder,'0272_Biased_17.5_3000.txt'); %change here
% Input_2 = strcat(Input_folder,'0272_Biased_17.5_3000.txt'); %change here
% avg_test10 = extract_avg(3000,Input_1,Input_2);

% graph = semilogy(avg_baseline,'k');
graph = semilogy(avg_test1,'k');
hold on;
% semilogy(avg_test1,'y');
semilogy(avg_test2,'c');
semilogy(avg_test3,'r');
% semilogy(avg_test13,'b');
% loyolagray = 1/255*[200,200,200];
% semilogy(avg_test,'Color',[0.8500, 0.3250, 0.0980]);
% semilogy(avg_test15,'g');
% semilogy(avg_test16,'Color',[0.8500, 0.3250, 0.0980]);
semilogy(avg_test18,'Color',[0.3250, 0.8500, 0.0980]);
semilogy(avg_test20,'m');

legend_list = {'Test1','Test2','Test3','Test18','Test20'};
legend(legend_list, 'Location', 'southoutside');
xlabel('Program/Erase Cycles');
ylabel('BER');
title('Test 3 vs 18 & 20');
grid on;
file_name = 'Test3_1820';
output = strcat(Input_folder,file_name);
output_jpg = strcat(output,'.jpg');
output_fig = strcat(output,'.fig');
saveas(graph, output_jpg);    %Save jpg
savefig(output_fig);                %Save figure


%%
%debug+
clear;
clc;
close all;
Input_folder = 'C:\Users\ygershon\OneDrive - Intel Corporation\Documents\SSD_project\new_expr\';   %change here
Output_folder = Input_folder;
Input_1 = strcat(Input_folder,'0278_Biased_18_3000.txt'); %change here
Input_2 = strcat(Input_folder,'0279_Biased_17.5_3000.txt');
[table1,vec1] = extract_data_TLC_modes(3000,Input_1);
[table2,vec2] = extract_data_TLC_modes(3000,Input_2);
vec_avg = avg_strange_vec(vec1,vec2);
mat_avg = avg_mat(table1,table2);


%
a = readtable(Input_1, 'HeaderLines', 2);
rawDataMat_a = table2array(a);
b = readtable(Input_2, 'HeaderLines', 2);
rawDataMat_b = table2array(b);
vec_0_1_avg = avg_mode(rawDataMat_a,rawDataMat_b,0,1);
vec_4_5_avg = avg_mode(rawDataMat_a,rawDataMat_b,4,5);
vec_2_1_avg = avg_mode(rawDataMat_a,rawDataMat_b,2,1);
vec_2_3_avg = avg_mode(rawDataMat_a,rawDataMat_b,2,3);
vec_3_4_avg = avg_mode(rawDataMat_a,rawDataMat_b,3,4);

graph = semilogy(vec_0_1_avg,'m');
hold on;
semilogy(vec_4_5_avg,'g');
semilogy(vec_2_1_avg,'b');
semilogy(vec_2_3_avg,'r');
semilogy(vec_3_4_avg,'k'); 
legend_list = {'4-3 BER','4-5 BER','2-1 BER','2-3 BER','3-4 BER'};
legend(legend_list, 'Location', 'southoutside');

xlabel('Program/Erase Cycles');
ylabel('BER');
title('Part 1 Graph 6');
grid on
output_dir = 'C:\Users\ygershon\Documents\SSD_project\assign1\';
output_file = strcat(output_dir,'part1Graph6');

%saveas(graph,strcat(output_file, '.jpg'),'jpg');    %Save jpg
%savefig(strcat(output_file, '.fig'));                %Save figure
%debug-
%%
for i = 1:num_of_page_type
    for j = 1:4
        Input_1_mat = extract_data_TLC(Input_1,vecPageType(i));
        Input_2_mat = extract_data_TLC(Input_2,vecPageType(i));
        Input_3_mat = extract_data_TLC(Input_3,vecPageType(i));
        
        [V3,V4] = calculate_verts_TLC(Input_1_mat, Input_2_mat, Input_3_mat...
                                  ,percents(j), num_of_skips, vecPageType(i), page_size);
                              
        export_data_TLC(chipname,percents(j),TestHeadline,i,Output_folder,V4,V3);
    end
end
    
%%
%calc entopy 

%test1
close all;
clear;
b0 = [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];
ent(b0)
b1 = [0.2 0.2 0.15 0.15 0.10 0.10 0.05 0.05];
b2 = [0.225 0.175 0.175 0.125 0.125 0.075 0.075 0.025];
b3 = [0.225 0.2 0.175 0.15 0.1 0.075 0.05 0.025];
b4 = [0.225 0.2 0.175 0.15 0.1 0.065 0.06 0.025];
b14 = [0.2 0.225 0.175 0.15 0.1 0.06 0.06 0.03];
e14 = ent(b14)
b15 = [0.175 0.225 0.175 0.175 0.1 0.06 0.065 0.025];
e15 = ent(b15)
b16 = [0.175 0.225 0.15 0.15 0.15 0.06 0.065 0.025];
e16 = ent(b16)
b18 = [0.18 0.23 0.18 0.14 0.1 0.06 0.08 0.03];
e18 = ent(b18)
b20 = [0.19 0.23 0.18 0.14 0.1 0.07 0.06 0.03];
sum(b20)





