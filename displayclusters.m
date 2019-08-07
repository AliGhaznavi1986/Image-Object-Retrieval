function displayclusters

for ii = 1:150
    
            f = figure('position', [0, 0, 1800, 900]);

    for i = 1:size(clusterv(ii).cluster,1)
        
        n = floor(sqrt(size(clusterv(ii).cluster,1)))+1;

        [X1,map1]=imread(fullfile(params.imgsDir,index.imgPaths{clusterv(ii).cluster(i,1),1}));
        subplot(n,n,i), imshow(X1,map1)
    end
end
