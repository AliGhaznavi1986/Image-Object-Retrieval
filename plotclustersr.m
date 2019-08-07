


examplarv = unique (idxV); % idx is ap result - examplar return canonical image

for  i = 1:size(examplarv)
    clusterv (i).examplar = examplarv(i); % save center of cluster in structure
    clusterv (i).cluster = find (idxV == examplarv(i));   % save related photo with each  cluster in structure
    
end
for ii = 1:100
    
            f = figure('position', [0, 0, 1800, 900]);

    for i = 1:size(clusterv(ii).cluster,1)
        
        n = floor(sqrt(size(clusterv(ii).cluster,1)))+1;

        [X1,map1]=imread(fullfile(params.imgsDir,random_image_1K_dir_listing(clusterv(ii).cluster(i,1)).name));
        subplot(n,n,i), imshow(X1,map1)
    end
end


for ii = 1:size(clusterv,2)
    
            f = figure('position', [0, 0, 1800, 900]);

    for i = 1:size(clusterv(ii).cluster,1)
        
        n = floor(sqrt(size(clusterv(ii).cluster,1)))+1;

        [X1,map1]=imread(fullfile(params.imgsDir,strcat(param.images{clusterv(ii).cluster(i,1),1},'.jpg')));
        subplot(n,n,i), imshow(X1,map1)
    end
end