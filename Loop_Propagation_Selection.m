
% for i = 1:size(clusterv,2)
for i = 1:50
    tic
    disp('loop:')
    disp(i)
    clustername = strcat('cluster_', num2str(i));
    
    pp = clusterv(i).cluster;
    for j = 1:size(clusterv(i).cluster)
        m = clusterv(i).cluster(j);
        id = find(idxT == idxT(m));
        pp = cat(1,pp,id);
        
    end
    clustV.pp = pp;
    
    propagation = unique(pp);
    clustV.propagation = propagation;
    p0 = zeros(size(clusterv(i).cluster,1),size(propagation,1));
    for j = 1:size(clusterv(i).cluster)
        
        m = clusterv(i).cluster(j);
        id = find(idxT == idxT(m));
        for jj = 1:size(id,1)
            iidx(jj) = find(propagation == id(jj));
            p0(j,iidx(jj))= 1;
        end
        
        
        
    end
    clustV(1).p0 = p0;
    X = double(BOW(propagation,:));
    clustV(1).X = X;
    XN = Normalize_BO(X);
    [XNC,idx] = compress_X(XN);
    clustV(1).XC = XNC;
    clustV(1).idx = idx;
    clustV(1).s0 = eye(size(clustV(1).XC,2));
    
    
    alpha = .5;
    beta = .5;
    
    for j = 1:2
        
        fprintf('calculating p matrix %d' , j);
        [ clustV(j).popt, clustV(j).fopt,~,~,~] = ...
            grad_descent_p(clustV(1).p0 , clustV(j).XC, alpha);
        fprintf('calculating AVW matrix %d' , j);
        clustV(j).AVW = clustV(j).popt * clustV(j).XC;
        fprintf('calculating s matrix %d' , j);
        [clustV(j).sopt,clustV(j).fsopt,~,~,~] = ...
            grad_descent_s(clustV(1).s0 , clustV(j).XC, beta);
        fprintf('calculating XC new %d' , j+1);
        clustV(j+1).XC = clustV(j).XC * clustV(j).sopt;
        
        
    end
    
    fprintf('Saving cluster %s to %s \n', clustername,fullfile(params.clusterDir));
    save(fullfile(params.clusterDir, strcat(clustername,'.mat'), 'clustV', '-v7.3'));
    toc
end