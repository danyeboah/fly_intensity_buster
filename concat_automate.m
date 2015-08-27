function concat_automate(read_in_filename,filesavename,probe_germplasm_marker,probe_germplasm_nonmarker,channel,channel_probeno,b,e,channel_probeno2)
% read_in_filename is the name of the tif files right before _c01 or _c02

% filesavename is the filename of the .jpg and .mat file you want saved.
% Do not include the embryo number for eg. If you want to save 'pgc_565, 
% nos_647,embryo1'....filesavename should be 'pgc_565,nos_647,embryo'

% probe_germplasm_marker is the string name of the probe used to mark germplasm
% probe_germplasm_nonmarker is the string name of the probe not used to
% mark germplasm

% channel refers to the channel from which germ plasm will be selected

% b - index of first file, usually 1
% e - index of last file

% run automate to read in each of the pair of images and extract the 
% necessary info

% channel_probeno2 = probe no_ for channel not used to mark germplasm
% channel_probeno = probe no. for channel used to mark germplasm

automate(read_in_filename,filesavename,probe_germplasm_marker,probe_germplasm_nonmarker,channel,b,e);

% convert probe number to string for eg. convert '647' of nos-647 to string
channel_probeno_str = num2str(channel_probeno);
channel_probeno2_str = num2str(channel_probeno2);

% convert first and second index to string
string_index1 = num2str(b);
string_index2 = num2str(e); 

% create filenames of jpg files to be saved
prefix_first_jpg = strcat('(histogram_',channel_probeno_str,'_to_',channel_probeno2_str,')');
prefix_second_jpg = strcat('(histogram_',channel_probeno2_str,'_to_',channel_probeno_str,')');

filename_concat1 = horzcat(prefix_first_jpg,filesavename,'(',string_index1,' to ',string_index2,')',',particle co-localization');

filename_concat2 = horzcat(prefix_second_jpg,filesavename,'(',string_index1,' to ',string_index2,')',',particle co-localization');


% concatenate data from all the files read in automate.m
[concat_germplasm_probe_to_other,concat_other_to_germplasm_probe] = readinfiles('dist_germplasmprobe_to_otherprobe','dist_otherprobe_to_germplasmprobe');
    
% create bin sizes for histogram
edge100     = 0:0.1:2.5;
    
% create first histogram of distances of localized particles of second
% probe from probe used to mark germ plasm
a = figure('name','Localized Histogram1');
[loc1_histpercentage, first3binspercentage1]   = FISH_histedit(concat_germplasm_probe_to_other,edge100, probe_germplasm_marker,probe_germplasm_nonmarker);
    
    
% create second histogram of distances of localized particles of probe used
% to mark germ plasm from second probe
b = figure('name','Localized Histogram2');
[loc2_histpercentage, first3binspercentage2]   = FISH_histedit(concat_other_to_germplasm_probe,edge100,probe_germplasm_nonmarker,probe_germplasm_marker);


%save jpegs
saveas(a,filename_concat1,'jpg');
saveas(b,filename_concat2,'jpg');


% create filename for saving workspace
file_concat_workspace = horzcat('(concatenated)',filesavename,'(',string_index1,' to ',string_index2,')',',workspace_data');

%save workspace data
save(file_concat_workspace);

% close all windows and clear all variables
close all
clear all
end

