function [cluster] = plotgraph(idx,simfinal)
figure

examplar = unique (idx); % idx is ap result - examplar return canonical image
for  i = 1:size(examplar)
    cluster (i).examplar = examplar(i); % save center of cluster in structure
    cluster (i).cluster = find (idx==examplar(i));   % save related photo with each  cluster in structure
    
end


% plot centers of clusters
x0 = rand;
y0 = rand;
% RC = 20;
RC = 30;


centers = zeros(size(cluster,1),2); % take circuls center randomly
for k = 1:size (cluster,2)
    
 t = 2*pi*(k/size(cluster,2));   % circle formulation- devid cricle to 11 part
 r = RC;
 x = x0 + r.*cos(t);
 y = y0 + r.*sin(t);
centers(k,1) = x;  % produce the 11 circle centers
centers(k,2) = y;  %produce the 11 circle centers
%  plot(x,y,'o')
hold on
end

% plot clusters  - show relation in the  cluster
cmap = hsv(size(centers,1));  % diffrent colocur for each circle 
% RCC = .5; % radius for smaller circles
RCC = 4; % radius for smaller circles

for  j = 1:size(centers,1)
    x0 = centers(j,1);
    y0 = centers (j,2);
    
    for ii = 1:(size(cluster(j).cluster,1)-1) % for member for each cluster . - for dont print center of cluster
        
%         plot(x0,y0,'O','Color',cmap(j,:))
        text(x0,y0,num2str(cluster(j).examplar),'FontSize',12) % type canonical image of cluster

        hold on
        t = 2*pi*(ii/size (cluster(j).cluster,1));
        r = RCC/simfinal(cluster(j).cluster(ii,1),cluster(j).examplar); % diffrenet r for represent similarity of image
        x = x0 + r.*cos(t);
        y = y0 + r.*sin(t);
%         plot(x,y,'o','Color',cmap(j,:))
         
        text(x,y,num2str(cluster(j).cluster(ii)),'FontSize',10) 
        
        X = [x0,x];
        Y = [y0,y];
        plot(X,Y,'Color',cmap(j,:))
        %  plot(x0,y0,'o')
        
        hold on
    end
    
end
% 
% % show edge between each cluster
% 
% for i = 1:size(centers,1)
%     
%     for j = 1:size(centers,1)
%         if (simfinal(cluster(j).examplar,cluster(i).examplar)>.13)
%             X = [centers(i,1),centers(j,1)];
%             Y = [centers(i,2),centers(j,2)];
%             plot(X,Y)
%             text((X(1,1)+X(1,2))/2,(Y(1,1)+Y(1,2))/2,num2str(simfinal(j,i)),'FontSize',8)
%             
%             hold on
%         end
%     end
% end

end