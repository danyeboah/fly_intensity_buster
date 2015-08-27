% Get image for first oligo
[oligo1 img1] = FISH_detection('Oligo 1');

% Determine localized vs unlocalized particles in img1
[loc1 unloc1 p1 h1] = FISH_separate_poly(img1,oligo1);

% Get image for second oligo
[oligo2 img2] = FISH_detection('Oligo 2');

loc_neighbor   = FISH_neighbor(loc1,oligo2,0.075);
unloc_neighbor = FISH_neighbor(unloc1,oligo2,0.075);

edge100     = 0:0.1:2.5;

figure('name','Localized Histogram');
loc1_hist   = FISH_hist(loc_neighbor,edge100);

figure('name','Unlocalized Histogram');
unloc1_hist = FISH_hist(unloc_neighbor,edge100);