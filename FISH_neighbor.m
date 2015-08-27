function neighbor = FISH_neighbor(mat1,mat2,px_um)

neighbor = NaN(1,size(mat1,1));

for i = 1:length(neighbor)
   allDist       = sqrt((mat2(:,1) - mat1(i,1)).^2 + ...
                        (mat2(:,2) - mat1(i,2)).^2);
                      
   neighbor(1,i) = px_um * min(allDist);         
end