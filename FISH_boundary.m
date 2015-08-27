% Adapted heavily from Mathworks website (interactive plotting)
% INPUT     img: image with FISH signal
%           dir: if horizontal, dir = 0; if vertical, dir = 1
% OUTPUT    p:   coefficients describing a polynomial to set up bound

function p = FISH_boundary(img,dir)

% DRAW: plot image amd open window to adjust levels
figure; imagesc(img); colormap(gray(256)); axis image; hold on; 
imcontrast;

pause;

xy = []; % Where clicked pts will be stored [COL1: x, COL2: y]
n  = 0;  % Counter for num of pts clicked

[xi,yi,but] = ginput(1); % First round of input

while but == 1 % Loop continues while user left-clicks
    
    plot(xi,yi,'rp');         % Leaves mark where new pt clicked
    n = n + 1;                % Increment counter for num of pts  
    xy(n,:) = [xi yi];        % Add on another row for new pt
    [xi,yi,but] = ginput(1);  % Get user input again
    
end

if dir == 1
    p = polyfit(xy(:,1),xy(:,2),2);     % Fit polynomial of degree 2
    plot(1:1024,polyval(p,1:1024),'c'); % Plot parabola
elseif dir == 0
    p = polyfit(xy(:,2),xy(:,1),2);     % Fit polynomial of degree 2
    plot(polyval(p,1:1024),1:1024,'c'); % Plot parabola
end
