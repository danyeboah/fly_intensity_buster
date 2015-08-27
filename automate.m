function automate(read_in_filename,filesavename,probe_germplasm_marker,probe_germplasm_nonmarker,channel,b,e)
% read_in_filename is the name of the Tiff files right before _c01 or _c02

% filesavename is the filename of the .jpg and .mat file you want saved.
% Do not include the embryo number for eg. If you want to save 'nos_647
% embryo1'....filesavename should be 'nos_647 embryo'

% probe_germplasm_marker is the string name of the probe used to mark
% germplasm eg. nos
% probe_germplasm_nonmarker is the string name of the probe not used to
% mark germplasm eg. pgc

% channel refers to the channel from which germ plasm will be selected eg.
% c01

% b - index of first file, usually 1
% e - index of last file

filestr1 = read_in_filename;    
filesave = filesavename;

% decide from which channel the germ plasm will be picked 
if channel == 'c01'
    filestr2 = '_c01.tif';
    filestr3 = '_c02.tif';
else channel == 'c02'
    filestr2 = '_c02.tif';
    filestr3 = '_c01.tif';
end

for (i = b : e)
    % used horzcat instead of strcat because horzcat considers spaces in the
    % concatenated filename
    stringindex = num2str(i); 
    filename1 = horzcat(filestr1,stringindex,filestr2);
    filename2 = horzcat(filestr1,stringindex,filestr3);

    % Get image for first oligo i.e. oligo that is being used to select 3'utr 
    [oligo1 img1] = FISH_detection2('Oligo 1',filename1);

    % Determine polygon in img1 
    [loc1 unloc1 p1 h1] = FISH_separate_poly(img1,oligo1);

    % Get image for second oligo 
    [oligo2 img2] = FISH_detection2('Oligo 2',filename2);



    % Determine particles of oligo2 that are "localized" or
    % "unlocalized" using the polygon drawn for oligo1
    in = inpolygon(oligo2(:,1),oligo2(:,2),p1(:,1),p1(:,2));
    loc2   = oligo2(in,:);
    unloc2 = oligo2(~in,:);

    % Just shows which points of oligo2 are "localized"
    %figure('name','Localized'); 
    imagesc(img2); colormap(gray(256)); axis image; hold on; 
    scatter(loc2(:,1), loc2(:,2),'+c')


    % Distance from localized particle of oligo2
    % from any oligo1 particle
    dist_germplasmprobe_to_otherprobe = FISH_neighbor(loc2,oligo1,0.075);
    unloc_neighbor1 = FISH_neighbor(unloc2,oligo1,0.075);

    % Distance from localized particle of oligo1
    % from any oligo2 particle
    dist_otherprobe_to_germplasmprobe = FISH_neighbor(loc1,oligo2,0.075);
    unloc_neighbor2 = FISH_neighbor(unloc1,oligo2,0.075);

    %create histogram bins
    edge100     = 0:0.1:2.5;

    a = figure('name','Localized Histogram1');
    loc1_hist   = FISH_histedit(dist_germplasmprobe_to_otherprobe,edge100,probe_germplasm_marker,probe_germplasm_nonmarker);

    %figure('name','Unlocalized Histogram1');
    %unloc1_hist = FISH_hist(unloc_neighbor1,edge100);

    b = figure('name','Localized Histogram2');
    loc2_hist   = FISH_histedit(dist_otherprobe_to_germplasmprobe,edge100,probe_germplasm_nonmarker,probe_germplasm_marker);


    filename1jpg = horzcat(filesave,stringindex,',particle co-localization1');
    filename2jpg = horzcat(filesave,stringindex,',particle co-localization2');

    filenameworkspace = horzcat(filesave,stringindex,',workspace_data');

    %save jpegs
    saveas(a,filename1jpg,'jpg');
    saveas(b,filename2jpg,'jpg');

    %save workspace data
    save(filenameworkspace);

    %no need to clear all because next iteration will override all variables
    close all;

end

%clear all
end

