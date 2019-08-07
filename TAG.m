
function [BOT,BOT2] = TAG(tagDir,files) 

listing = files;

[~,index] = sortrows({listing.name}.'); listing = listing(index); clear index

     
for i= 1:size(listing,1)
     IDcell = strsplit(listing(i).name,'.jpg');
     ID = IDcell{1,1};
     name = strcat(ID,'.txt');  
    % Return tag location %
  
   if exist(strcat(tagDir,name), 'file')
        
        % Returan File name for each txt info and open it%
        fileID = fopen(strcat(tagDir,name),'r');

        C = textscan(fileID, '%s','Delimiter','');
        tagline = C{1,1}{end,1};
        C = strsplit(tagline,'tag: ');
        C = C{1,2};
        C = strsplit(C,'%*');
        
        fclose(fileID);
        
        for j = 1:length(C)
            
            alltags{j,i} = C{1,j};
            
        end
        
    end
end

    ncolumn = sum(~cellfun('isempty',alltags)); % sum all tag for each image
    
    listtags = struct;
   k = 1; 
    for i = 1:size(listing)
        disp(i)
        for j = 1:ncolumn(i)
            listtags(k).ID = k;
            listtags(k).tag = alltags{j,i};
            k = k+1;
        end
    end
    

n = length(listtags);

for i = 1:n
    
    withduplicatetags{i}= listtags(i).tag;
    
end

wd=withduplicatetags;
[~,idx]=unique(  withduplicatetags , 'rows'); % remove repeated tags
withoutduplicates = withduplicatetags(:,idx);
index = zeros;


tic
tag3=int8(size(index));
for i = 1:size(listing)
    
   disp(i)
    for j = 1:ncolumn(i)
        
      index(j,i) =  find(strcmp( alltags{j,i}, withoutduplicates)); %find index of tags in withoutduplicate
      tag3(index(j,i),i)=int8(1);

    end
    
end
toc

    
S = sum(tag3,2); %sumation each tag in all image

k = 1;

tic
for i = 1 :size(tag3,1)
    disp(i)
    if (S(i) ~= 1)
        tag5 (k,:) = tag3(i,:);
        
    k = k+1;
    end
         
end
toc


BOT = transpose(tag5);
BOT2 = transpose(tag3);

end