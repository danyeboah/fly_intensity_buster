function [channel1_loc_fold_increase, channel2_loc_fold_increase] = intensity_analysis(dataset,channel1_rna, channel2_rna)

% dataset = name of data eg. nos-647,pgc-565, round 1 

% channel1_loc_fold_increase = fold increase in channel 1 localized
% intensities from the unlocalized intensities

% channel2_loc_fold_increase = fold increase in channel 2 localized
% intensities from the unlocalized intensities

% channel1_rna = rna being visualized in channel1
% channel2_rna = rna being visualized in channel2


%create matrix to store and concatenate intensity per unit area
channel1_localized = [];  
channel2_localized = [];

channel1_unlocalized = [];
channel2_unlocalized = [];

% create matrix to store and concatenate intensity only
channel1_localized_sansarea = [];
channel2_localized_sansarea = [];


channel1_unlocalized_sansarea = [];
channel2_unlocalized_sansarea = [];




% create array of .mat files in folder
% after creating array of .mat files, remove the collated matlab file
mat_files = dir('*.mat');

x = 0;
for i=1:length(mat_files)
    if (~isempty(findstr(mat_files(i).name, 'collated')))
        x = i;
    end
end

% remove file containing with concatenated in filename
if (x > 0)
    mat_files(x) = [];
end

% iterate through all .mat files in folder
for i=1:length(mat_files)
    
    %load specified file and specified variables
    load(mat_files(i).name,'loc1','loc2','unloc1','unloc2');
    
    % append a column containing the intensity per unit area
    loc1(:,5) = loc1(:,3) ./ loc1(:,4);
    loc2(:,5) = loc2(:,3) ./ loc2(:,4);
    unloc1(:,5) = unloc1(:,3) ./ unloc1(:,4);
    unloc2(:,5) = unloc2(:,3) ./ unloc2(:,4);
    
    % vertically concatenate intensity per unit areas
    channel1_localized = [channel1_localized; loc1(:,5)];
    channel2_localized = [channel2_localized; loc2(:,5)];
    channel1_unlocalized = [channel1_unlocalized; unloc1(:,5)];
    channel2_unlocalized = [channel2_unlocalized; unloc2(:,5)];
    
    % vertically concatenate intensities only without dividing by area
    channel1_localized_sansarea = [channel1_localized_sansarea; loc1(:,3)];
    channel2_localized_sansarea = [channel2_localized_sansarea; loc2(:,3)];
    
    channel1_unlocalized_sansarea = [channel1_unlocalized_sansarea; unloc1(:,3)];
    channel2_unlocalized_sansarea = [channel2_unlocalized_sansarea; unloc2(:,3)];

    
end

% find mean and standard deviations of the intensity/area
average_channel1_localized = mean(channel1_localized);
stddev_channel1_localized = std(channel1_localized);

average_channel1_localized_sansarea = mean(channel1_localized_sansarea);
stddev_channel1_localized_sansarea = std(channel1_localized_sansarea);

average_channel2_localized = mean(channel2_localized);
stddev_channel2_localized = std(channel2_localized);

average_channel2_localized_sansarea = mean(channel2_localized_sansarea);
stddev_channel2_localized_sansarea = std(channel2_localized_sansarea);


average_channel1_unlocalized = mean(channel1_unlocalized);
stddev_channel1_unlocalized = std(channel1_unlocalized);

average_channel1_unlocalized_sansarea = mean(channel1_unlocalized_sansarea);
stddev_channel1_unlocalized_sansarea = std(channel1_unlocalized_sansarea);

average_channel2_unlocalized = mean(channel2_unlocalized);
stddev_channel2_unlocalized = std(channel2_unlocalized);

average_channel2_unlocalized_sansarea = mean(channel2_unlocalized_sansarea);
stddev_channel2_unlocalized_sansarea = std(channel2_unlocalized_sansarea);



% find fold increase for channel 1 intensities
channel1_loc_fold_increase = average_channel1_localized / average_channel1_unlocalized;
channel1_loc_fold_increase_sansarea = average_channel1_localized_sansarea / average_channel1_unlocalized_sansarea;


% find fold increase for channel 2 intensities
channel2_loc_fold_increase = average_channel2_localized / average_channel2_unlocalized;
channel2_loc_fold_increase_sansarea = average_channel2_localized_sansarea / average_channel2_unlocalized_sansarea;


% write to file
filename = strcat(dataset,' intensity_analysis.txt');

Text1 = strcat('intensity/area fold increase of ',channel1_rna,' = ',num2str(channel1_loc_fold_increase));

Text2 = strcat('intensity/area fold increase of ',channel2_rna,' = ',num2str(channel2_loc_fold_increase)); 

Text3 = strcat('intensity fold increase of ',channel1_rna,' = ',num2str(channel1_loc_fold_increase_sansarea));

Text4 = strcat('intensity fold increase of ',channel2_rna,' = ',num2str(channel2_loc_fold_increase_sansarea));


f = fopen(filename, 'w');
fprintf(f,'%s\r\n', Text1, Text2, Text3, Text4);
fclose(f);



%hist(channel1_localized);
%hist(channel1_unlocalized);










