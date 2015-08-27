function pick(id)
% This script takes in the id of a set of files to be analyzed.
% id eg. 20140409_yw_cycB565_gp3


% analyze hi_power data to obtain cutoff
analyzeShawnLibrary('test',' ',' ');
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

close all
% reanalyze data using threshold
analyzeShawnLibrary('fad',1,'quickAnalyze16',b);

clear all

% load file containing final dog data
tobeloaded = strcat(id,'/quickAnalyze/CompactResults_',id,'.mat');
load(tobeloaded,'fishAnalysisData');

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


% select two points on the plot to be used to calculate gradient
[z,x1,y1] = selectdata('selectionmode','closest','verify','on');
[z,x2,y2] = selectdata('selectionmode','closest','verify','on');

close;

% calculate gradient
scale = (y2 - y1)/(x2 - x1);

% select bulk cytoplasm in high-intensity data
hist(log10(hi_power),100);
% select threshold below which is bulk cytoplasm
[z,xhi,yhi] = selectdata('selectionmode','closest','verify','on');
close;
hi_power_cytoplasm = hi_power_sort(hi_power_sort < (10 ^ xhi));

single_rna = mean(hi_power_cytoplasm);

% select germ plasm in lo_power data
hist(log10(lo_power),100);
% select threshold below which is bulk cytoplasm
[z,xlo,ylo] = selectdata('selectionmode','closest','verify','on');
close;
lo_power_germplasm = lo_power_sort(lo_power_sort > (10 ^ xlo));


% multiply lo_power_germplasm by scale
lo_power_germplasm = lo_power_germplasm * scale;

end











