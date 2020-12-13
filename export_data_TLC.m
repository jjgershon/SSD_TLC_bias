%------
% Examples: 
%      Output_base_path = 'c:\all_graphs\'
%      TestHeadline = 
%         LHH                    = 1;
%         LHH_One_Skip           = 2;
%         LHH_Two_Skip           = 3;
%         Baseline               = 4;
%         Baseline_One_Skip      = 5;
%         Baseline_Two_Skip      = 6;
%         Alternating            = 7;
%         Baseline biased low 30 = 8;
%         Baseline biased low 35 = 9;
%         Baseline biased low 40 = 10;
%         Baseline biased low 45 = 11;
%         Baseline biased High 30 = 12;
%         Baseline biased High 35 = 13;
%         Baseline biased High 40 = 14;
%         Baseline biased High 45 = 15;
%         Baseline biased High 45 Low 30 = 16
%         Baseline biased High 45 Low 35 = 17
%         Baseline biased High 45 Low 40 = 18
%         Baseline biased High 45 Low 45 = 19
%         Baseline biased Low 45 High 30 = 20
%         Baseline biased Low 45 High 35 = 21
%         Baseline biased Low 45 High 40 = 22
%         Baseline biased Low 45 High 45 = 23
%         Baseline biased Low 45 High 40 = 24
%         Baseline biased Low 40 High 40 = 25
%         Baseline biased Low 35 High 40 = 26
%         Baseline biased Low 30 High 40 = 27
%         Baseline biased Low 45 High 35 = 28
%         Baseline biased Low 40 High 35 = 29
%         Baseline biased Low 35 High 35 = 30
%         Baseline biased Low 30 High 35 = 31
%         Baseline biased Low 45 High 30 = 32
%         Baseline biased Low 40 High 30 = 33
%         Baseline biased Low 35 High 30 = 34
%         Baseline biased Low 30 High 30 = 35
%         Baseline biased low 0 = 36;
%         Baseline biased low 10 = 37;
%         Baseline biased low 20 = 38;
%         Baseline biased low 60 = 39;
%         Baseline biased low 70 = 40;
%         Baseline biased low 80 = 41;
%         Baseline biased low 90 = 42;
%         Baseline biased low 100 = 43;


%      PageType =
%         LowPage   = 1;
%         Middle    = 2
%         H1Page    = 3;
%         TotalPage = 4;

function export_data_TLC(Chipname,Precentile,TestHeadline,PageType,Output_base_path,avg_BER,max_Or_Percent_BER)

%-------------------
vecPageType             = {'L','M','H1','Total'};
vecTestHeadline         = {'LHH','LHH.One.Skip','LHH.Two.Skip','Baseline','Baseline.One.Skip'...   %5 items                                                                 
                           ,'Baseline.Two.Skip','Alternating','Baseline.biased.low.30.percent'...  %3 items
                           ,'Baseline.biased.low.35.percent' ,'Baseline.biased.low.40.percent'...   %2 items
                           ,'Baseline.biased.low.45.percent' ,'Baseline.biased.high.30.percent'...  %2 items
                           ,'Baseline.biased.high.35.percent','Baseline.biased.high.40.percent'... %2 items
                           ,'Baseline.biased.high.45.percent','Baseline.biased.high.45.low.30.percent'... %2 items
                           ,'Baseline.biased.high.45.low.35.percent','Baseline.biased.high.45.low.40.percent'... %2 items
                           ,'Baseline.biased.high.45.low.45.percent','Baseline.biased.low.45.high.30.percent'... %2 items
                           ,'Baseline.biased.low.45.high.35.percent','Baseline.biased.low.45.high.40.percent'... %2 items 
                           ,'Baseline.biased.low.45.high.45.percent','Baseline.biased.low.45.high.40.percent'... %2 items
                           ,'Baseline.biased.low.40.high.40.percent','Baseline.biased.low.35.high.40.percent'... %2 items
                           ,'Baseline.biased.low.30.high.40.percent','Baseline.biased.low.45.high.35.percent'... %2 items
                           ,'Baseline.biased.low.40.high.35.percent','Baseline.biased.low.35.high.35.percent'... %2 items
                           ,'Baseline.biased.low.30.high.35.percent','Baseline.biased.low.45.high.30.percent'... %2 items
                           ,'Baseline.biased.low.40.high.30.percent','Baseline.biased.low.35.high.30.percent'... %2 items
                           ,'Baseline.biased.low.30.high.30.percent', 'Baseline.biased.low.0.percent'...  %2 items
                           ,'Baseline.biased.low.10.percent', 'Baseline.biased.low.20.percent'...  %2 items
                           ,'Baseline.biased.low.60.percent', 'Baseline.biased.low.70.percent'...  %2 items
                           ,'Baseline.biased.low.80.percent', 'Baseline.biased.low.90.percent'...  %2 items
                           ,'Baseline.biased.low.100.percent','L.&.M.&.H.biased.20%.2k.iterations','L.&.M.&.H.biased.40%.2k.iterations','L.&.M.&.H.biased.50%.2k.iterations','L.&.M.&.H.biased.70%.2k.iterations','L.&.M.&.H.biased.90%.2k.iterations'... %6 items
                           ,'L.60%.M.&.H.unbiased','L.60%.M.50%.H.40%','M.&.H.unbiased.L.Biased.0%'};  %3 items
%-------------------

if (Precentile == 1) 
    Percent = 'Max';
else
    Percent = strcat(num2str(Precentile*100),'%'); 
end;

GraphTitle   = strcat(Chipname,'.',vecTestHeadline(TestHeadline)       ,'.',vecPageType(PageType),'.',Percent);
FileBaseName = strrep(GraphTitle,'.','_');

%Example: BaseName = 'Chipname_LHH_L_Percent' \ 'Chipname_LHH_H1_Percent' \...

GraphOutputPath     = strcat(Output_base_path, FileBaseName);
VectorOutputPath    = GraphOutputPath;

[~,num_iterations]  = size(avg_BER);
BER_limit_vec = ones(1,num_iterations)*1e-3;

graph = semilogy(avg_BER,'.b');
hold on;

semilogy(max_Or_Percent_BER,'.g');
semilogy(BER_limit_vec     ,'k' );

legend('avg BER',strcat(Percent,' BER'));
xlabel('Program/Erase Cycles');
ylabel('BER');

title(GraphTitle);
grid on

saveas(graph, strcat(GraphOutputPath{1},'.jpg'), 'jpg');    %Save jpg
savefig(strcat(GraphOutputPath{1},'.fig'));                 %Save figure

vector = linspace(1,num_iterations,num_iterations);

csvwrite(strcat(VectorOutputPath{1},'_max_or_percent_BER.txt')    ,[vector',max_Or_Percent_BER'] );
csvwrite(strcat(VectorOutputPath{1},'_avg_BER.txt')               ,[vector',avg_BER']);
hold off

end

