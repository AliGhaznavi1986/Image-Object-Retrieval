
examplarv = unique (idxV); % idx is ap result - examplar return canonical image

for  i = 1:size(examplarv)
    clusterv (i).examplar = examplarv(i); % save center of cluster in structure
    clusterv (i).cluster = find (idxV == examplarv(i));   % save related photo with each  cluster in structure
    
end


examplart = unique (idxT); % idx is ap result - examplar return canonical image for texual cluster

for  i = 1:size(examplart)
    clustert (i).examplar = examplart(i); % save center of cluster in structure
    clustert (i).cluster = find (idxT == examplart(i));   % save related photo with each  cluster in structure
    
end

for i = 1 :  size(clusterv,2)

    pp = clusterv(i).cluster;

for j = 1:size(clusterv(i).cluster)
    m = clusterv(i).cluster(j);
    id = find(idxT == idxT(m));
    pp = cat(1,pp,id);
   
end

clusterv(i).propagation = unique(pp);
end

for i = 1 :  size(clusterv,2)
    
    clusterv(i).p0 = zeros(size(clusterv(i).cluster,1),size(clusterv(i).propagation,1));
    
end

for i = 1:size(clusterv,2)
    
    for j = 1:size(clusterv(i).cluster)
        
        m = clusterv(i).cluster(j);
        id = find(idxT == idxT(m));
        for jj = 1:size(id,1)
            iidx(jj) = find(clusterv(i).propagation == id(jj));
            clusterv(i).p0(j,iidx(jj))= 1;
        end
        
        
        
    end
    
end


for i = 1:size(clusterv,2)


clusterv(i).X = BOW(clusterv(i).propagation,:);

end

for i = 1:size(clusterv,2)


clusterv(i).PX = clusterv(i).p0 * clusterv(i).X;

end

for i = 1:size(clusterv,2)

    for ii = 1:size(clusterv(i).cluster,1)
        
        AVW(clusterv(i).cluster(ii),:) = clusterv(i).AVW(ii,:);
        
    end
    
end

