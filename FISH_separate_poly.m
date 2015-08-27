% INPUT     img:    image with FISH signal
%           oligo:  output from FISH_detection
% OUTPUT    loc:    info for localized particles
%           unloc:  info for unlocalized particles
%           p:      vertices for user-defined polygon

function [loc unloc p h] = FISH_separate_poly(img, oligo)

% DRAW: plot image amd open window to adjust levels
figure; imagesc(img); colormap(gray(256)); axis image; hold on; 
imcontrast;

% User defines a polygon
h = impoly;
p = wait(h);

% Inside polygon = localized; outside polygon = unlocalized
in = inpolygon(oligo(:,1),oligo(:,2),p(:,1),p(:,2));
loc = oligo(in,:);
unloc = oligo(~in,:);

% Just as a check, plot localized points
figure('name','Localized pgc'); imagesc(img); 
colormap(gray(256)); axis image; hold on;
scatter(loc(:,1),loc(:,2),'g+');

% Just as a check, plot unlocalized points
figure('name','Unlocalized pgc'); imagesc(img); 
colormap(gray(256)); axis image; hold on; 
scatter(unloc(:,1),unloc(:,2),'r+');