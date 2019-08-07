function [s,simfinal] = mapreduce(BOW)

%% MAP REDUCE
% sakht structure invert list baraye map reduce
invertlist = struct;

for  i = 1:size(BOW,2)
    
    nonzerosidx = find(BOW(:,i));  % return non zeros index of L (Vw(i))
    l = zeros ( size(nonzerosidx,1) ,2); % creat zeros matrix for each VW List
    l(:,1)=nonzerosidx;
    l(:,2)=BOW(nonzerosidx,i);
    invertlist(i).list = l;
end

%
for n = 1:size(BOW,2)
    
    l = invertlist(n).list;
    nrow = size(invertlist(n).list,1);
    nap = (nrow*nrow-nrow)/2;
    M = zeros(nap,3);
    j = 1;
    for i=1:nrow
        
        for k = [1:i-1,i+1:nrow]
            
            if (invertlist(n).list(i,1)<invertlist(n).list(k,1)) % shebahat tekrari mohasebe nakon
                M(j,1) = invertlist(n).list(i,1); %cosine sim index
                M(j,2) = invertlist(n).list(k,1); %cosine sim index
                %             M(j,3) = invertlist(n).list(i,2)*invertlist(n).list(k,2);
                M(j,3) = (invertlist(n).list(i,2)*invertlist(n).list(k,2));  %cosine similarity formule /(sqrt(sumsqr(BOW(i,:))*sumsqr(BOW(k,:))))
                j = j+1;
            end
        end
        
    end
    invertlist(n).sim = M;
    disp(n)
end


simfinal = zeros(size(BOW,1),size(BOW,1)); % i * i sim matrix
for ii=1:size(BOW,2)
    disp(ii)
    for jj=1:size (invertlist(ii).sim,1)
        
        simfinal(invertlist(ii).sim(jj,1),invertlist(ii).sim(jj,2))= ...
            simfinal(invertlist(ii).sim(jj,1),invertlist(ii).sim(jj,2))...
            + invertlist(ii).sim(jj,3);   % sum of all cosine sim for all vw
        
    end
end


% s for apcluster
nrow = size(BOW,1);
nap = nrow*nrow-nrow;
s = zeros(nap,3);
j = 1;
for i=1:nrow
    tic
%     disp (i)
    for k = [1:i-1,i+1:nrow]
        s(j,1) = i;
        s(j,2) = k;
%         if((sum(BOW(i,:),1)+ sum(BOW(k,:),1))~=0)
%           s(j,3)=simfinal(i,k)/(sqrt(sumsqr(BOW(i,:))*sumsqr(BOW(k,:))));
            s(j,3)=simfinal(i,k);
            
%         end
        j = j+1;
%         disp(i)
%         disp(j)
    end
    fprintf('Calculation time for similarity matrix for image : \n',i);
    disp(i)
    toc
end

end