function analyze_intensity(id, mrna)
% This script takes in the id of a set of files to be analyzed.
% id eg. 20140409_yw_cycB565_gp3
% It also takes in the mrna being looked at eg. cycB

% analyze hi_power data to obtain cutoff
analyzeShawnLibrary('test','','');
analyzeShawnLibrary('fad',1,'quickAnalyze16',Inf);
analyzeShawnLibrary('thresh',1,'test_threshold_whitby');

% load file containing dog data after 'test_threshold_whitby' runs
tobeloaded = strcat(id,'/test_threshold/CompactResults_',id,'.mat');
load(tobeloaded,'fishAnalysisData');

% draw histogram of dog data and selected threshold in valley
hist(fishAnalysisData.channels(2).fits.dog,200);
title('Select A Point Where There is a Valley in the Histogram')
xlabel('DOG intensity');
[a,b,c] = selectdata('selectionmode','closest','verify','on');

close;
% reanalyze data using threshold
analyzeShawnLibrary('fad',1,'quickAnalyze16',b);

%clear fishAnalysisData;

% load file containing final dog data
tobeloaded2 = strcat(id,'/quickAnalyze/CompactResults_',id,'.mat');
load(tobeloaded2,'fishAnalysisData');

% extract lo and hi power dog data
lo_power = fishAnalysisData.channels(1).fits.dog;
hi_power = fishAnalysisData.channels(2).fits.dog;

%sort dog data
lo_power_sort = sort(lo_power);
hi_power_sort = sort(hi_power);

% find number of elements in lo_power
x = numel(lo_power_sort);

% obtain dog intensity data from hi_power that is 
% also in lo_power i.e. least x intensity in hi_power
hi_power_sort_paired = hi_power_sort(1:x);


% plot lo power data on x-axis and hi power data on y axis to determine
% factor by which lo power data has to be multiplied
plot(lo_power_sort,hi_power_sort_paired);
title('Select two points on a relatively straight part of the graph');
xlabel('lo power intensity');
ylabel('hi power intensity');


% select two points on the plot to be used to calculate gradient
[z1,x1,y1] = selectdata('selectionmode','closest','verify','on');
[z2,x2,y2] = selectdata('selectionmode','closest','verify','on');

close;
disp(y2);
disp(y1);
disp(x1);
disp(x2);
% calculate gradient
scale = (y2 - y1)/(x2 - x1)
disp(scale);

% select bulk cytoplasm in high-intensity data
hist(log10(hi_power),100);
title('Select point in valley in histogram to obtain hi power germplasm');
xlabel('hi power dog intensity');

% select threshold below which is bulk cytoplasm
[zhi,xhi,yhi] = selectdata('selectionmode','closest','verify','on');
close;
hi_power_cytoplasm = hi_power_sort(hi_power_sort < (10 ^ xhi));

single_rna = mean(hi_power_cytoplasm);

% select germ plasm in lo_power data
hist(log10(lo_power),100);
title('Select point in valley in histogram to obtain lo_power germplasm');
xlabel('lo power dog intensity');

% select threshold below which is bulk cytoplasm
[zlo,xlo,ylo] = selectdata('selectionmode','closest','verify','on');
close;
lo_power_germplasm = lo_power_sort(lo_power_sort > (10 ^ xlo));


% multiply lo_power_germplasm by scale
lo_power_germplasm_scaled = lo_power_germplasm * scale;

% multiply all of lo_power by scale
lo_power_scaled = lo_power_sort * scale;

% plot histogram of lo_power germplasm intensity divided by intensity of
% single rna in hi_power
average_relative_lo_power_germplasm = lo_power_germplasm_scaled/single_rna;
range_germplasm = max(average_relative_lo_power_germplasm) - min(average_relative_lo_power_germplasm);
range_germplasm = num2str(range_germplasm);

mean_germplasm = mean(average_relative_lo_power_germplasm);
mean_germplasm = num2str(mean_germplasm);


test_range = horzcat('range of numbers of mRNA = ',range_germplasm);
test_mean = horzcat('average number of mRNA = ',mean_germplasm);

title_top = strcat('Histogram of number of mRNA in germ plasm');

%hist(average_relative_lo_power_germplasm);

hist(lo_power_scaled/single_rna);
title(title_top);
xlabel('Number of mRNA in germplasm');
text(3,100,test_range,'FontSize',20,'FontWeight','bold');
text(3,80,test_mean,'FontSize',20,'FontWeight','bold');

scale_to_disp = strcat('scale = ', scale);

disp(scale_to_disp);
disp(test_range);
disp(test_mean);

end
















