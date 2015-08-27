function [ output_args ] = intensity_analyzer(id, mrna)
% this function is used to analyze the intensity of probes in an image
% specifically it is used to determine the fold increase in mrna in the
% germ plasm of drosophila from the bulk cytoplasm
% the function will take in two different stacks of images:
% a high intensity image and a low intensity one
% this function first creates a pseudostack of both the high and low
% intensity image.

% the function then first creates a tag file; using information in the tag file,
% the function filters out spurious spots in the high intensity image
% It then adjust intensities in the low intensity image to match the high
% intensity image

% input variables
% id eg. 20140409_yw_cycB565_gp1

filename1 = strcat(id,'lo.tif');
filename2 = strcat(id,'hi.tif');

% create  pseudo image for lo_intensity
im1 = imread(filename1);
im1_pseudo = im1 / 2;

filename1_pseudo1 = strcat(id,'lo_z01.tif');
filename1_pseudo2 = strcat(id,'lo_z03.tif');
filename1_notpseudo = strcat(id,'lo_z02.tif');


imwrite(im1_pseudo,filename1_pseudo1);
imwrite(im1_pseudo,filename1_pseudo2);
imwrite(im1,filename1_notpseudo);



% create pseudo image for hi_intensity
im2 = imread(filename2);
im2_pseudo = im2 / 2;

filename2_pseudo1 = strcat(id,'hi_z01.tif');
filename2_pseudo2 = strcat(id,'hi_z03.tif');
filename2_notpseudo = strcat(id,'hi_z02.tif');


imwrite(im2_pseudo,filename2_pseudo1);
imwrite(im2_pseudo,filename2_pseudo2);
imwrite(im2,filename2_notpseudo);


% create tag file
intro(id, mrna);

% analyze intensity stuff
analyze_intensity(id, mrna);




end

