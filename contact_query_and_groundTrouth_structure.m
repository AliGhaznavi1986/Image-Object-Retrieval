function contact_query_and_groundTrouth_structure 
j = 1;
GrAndQu = gr_tr_listing;
for i = 1:56
    GrAndQu(i+1226) = query_listing(j);
    j = j+1;
    
end


j=1;
cell = {Data_image_dir_listing.name};
Data_image_dir_listingWithothGtAndQu = Data_image_dir_listing;
for i = 1:1282
 name = GrAndQu(i).name;    
 IndexC = strfind(cell, name);
 Index = find(not(cellfun('isempty', IndexC))) ;
 ind(j) = Index;
 j = j+1;
end

Data_image_dir_listingWithothGtAndQu(ind) = []; 
 
random = randperm(size(Data_image_dir_listingWithothGtAndQu,1),2718);
N_random_image_dir_listing = Data_image_dir_listingWithothGtAndQu(sort(random));
N_random_image_dir_listing = N_random_image_dir_listing.';


    
    random_image_4K_dir_listing = GrAndQu;
    random_image_4K_dir_listing = random_image_4K_dir_listing.';
    
N_random_image_dir_listing = rmfield(N_random_image_dir_listing, 'date');
N_random_image_dir_listing = rmfield(N_random_image_dir_listing, 'bytes');
N_random_image_dir_listing = rmfield(N_random_image_dir_listing, 'datenum');
N_random_image_dir_listing = rmfield(N_random_image_dir_listing, 'isdir');
random_image_4K_dir_listing = rmfield(random_image_4K_dir_listing, 'bytes');
    
    j = 1;
for i = 1:size(N_random_image_dir_listing,1)
    random_image_4K_dir_listing(i+1282) = N_random_image_dir_listing(j);
    j = j+1;
    
end

source = 'C:\Users\Dixpm\Documents\MATLAB\data\11K\jpg_Flickr11K\jpg_Flickr11K\';
destination = 'C:\Users\Dixpm\Documents\MATLAB\data\4K\';

for i = 1:4000
    
copyfile(fullfile(source,strcat(random_image_4K_dir_listing(i).name,'.jpg')),destination);
disp(i)
end
    


    
