% INPUT     mat:   matrix w/ x-coords in COL1 and y-coords in COL2
%           p:     coeffs describing curve delimiting loc vs unloc
%           u:     true if oocyte looks like a 'u', false if other dir
% OUTPUT    loc:   rows from 'mat' representing loc pts
%           unloc: rows from 'mat' representing unloc pts

function [loc unloc] = FISH_separate(mat,p,u)
 
% Initialize vector of all zeros
less = zeros(length(mat),1);

% If y-value for point is less than curve, mark down as 1
for i = 1:size(less,1)
    if mat(i,2) < polyval(p,mat(i,1))
            less(i) = 1;
    end
end

% Convert 'less' from numbers to true and false values
less = logical(less);

if u == true % if oocyte oriented so it looks like the letter 'u'
    loc   = mat(not(less),:);
    unloc = mat(less,:);
else % if oocyte is oriented so it's an upside down 'u'
    unloc = mat(not(less),:);
    loc   = mat(less,:);    
end