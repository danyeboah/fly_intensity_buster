function [loc_neighborconcat1,loc_neighborconcat2] = readinfiles(varstr1,varstr2)

%varstr1 = the name of the first variable u want loaded
%varstr2 = the name of the second variable u want loaded

%output
%loc_neighborconcat1 = a row matrix containing all the variables from the
%file that has been concatenated horizontally

%loc_neighborconcat2 = a row matrix containing all the variables from the
%second file that has been concatenated horizontally

% This program reads in the specified variables in the input from the
% specified files.
% It then concatenates them horizontally into one matrix.


%create matrix to store and concatenate each row of read-in data
loc_neighborconcat1 = [];
loc_neighborconcat2 = [];

% create array of .mat files in folder
mat_files = dir('*.mat')

% iterate through all .mat files in folder
for i=1:length(mat_files)

%load specified file and specified variables
load(mat_files(i).name,varstr1,varstr2);


% obtain variable contents
test1 = eval(varstr1);
test2 = eval(varstr2);

%concatenate variable contents with results from previous iterations
loc_neighborconcat1 = horzcat(loc_neighborconcat1,test1);
loc_neighborconcat2 = horzcat(loc_neighborconcat2,test2);


end

end

