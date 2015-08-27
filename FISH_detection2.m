function [mat orig_img] = FISH_detection(window_title,filename)

% LOAD: Find image to be analyzed and convert it into a matrix
%[name, path] = uigetfile('*.tif',window_title);

%Daniel:Read in file
orig_img   = double(imread(filename));

% DETECT: Create median-filtered image and detect spots
med_img         = medfilt2(orig_img);
[results, mask] = spotDetector(med_img,4,1);

% MEASURE: Pull out useful information and store in a matrix. Each row
% corresponds to a distinct spot.
mat = NaN(size(results.xCoord,1),4); % Create matrix w/proper num of rows
mat(:,1) = results.xCoord(:,1);      % Column1: x-coordinate
mat(:,2) = results.yCoord(:,1);      % Column2: y-coordinate
mat(:,3) = results.totalInt(:,1);    % Column3: total intensity
mat(:,4) = results.area(:,1);        % Column4: area