
%% Initialization (Set parameters)

initial

%% Bilding VW Dictionary by using K-means

model = bow_computeVocab(params);
save(fullfile(params.resDir, 'model.mat'), 'model');


model.vocabSize = params.numWords;
model.vocab = dict;
model.kdtree = vl_kdtreebuild(model.vocab);
save(fullfile(params.resDir, 'model.mat'), 'model');

iindex = bow_buildInvIndex(params, model);

% TEST

% I = imread('C:\Users\Dixpm\Documents\MATLAB\data\1K\72812189.jpg');
I = imread('C:\Users\Dixpm\Documents\MATLAB\data\1K\1161893623.jpg');
config.topn = 20; % set the number of top matches to retrieve
config.geomRerank = 1; % set to have geometric reranking, ignore if not.
[imgPaths, scores] = bow_imageSearch(I, model, index, config);


f = figure('position', [0, 0, 1800, 900]);
for  i = 1:size(imgPaths,2)
    
    %Create Figure
    
    n = floor(sqrt(size(imgPaths,2))+1);
    
    [X1,map1]=imread(fullfile(params.imgsDir,imgPaths{1,i}));
    subplot(n,n,i), imshow(X1,map1)
    hold on
end


%% Load BOW 

load(fullfile(params.resDir,'BOW.mat'));

%% UPDATE BOW VIA TF-IDF

% BOW = transpose(TFIDF(transpose(BOW)));

%% NORMALIZE BOW MATRIX

BOW = double(BOW);
BOW = Normalize_BO(BOW);
[BOT,BOT2] = TAG(params.tagDir,random_image_1K_dir_listing);

%% COMPUTE SIMILARITY USING MAPREDUCE ALGORITHM

[s,simfinalV] = mapreduce(BOW);
[stag,simfinalT] = mapreduce(BOT2);


%% RUN AP Clustering

p=median(s(:,3));
[idxV,netsim,dpsim,expref]=apcluster(s,p,'plot');

p=median(stag(:,3));
[idxT,netsim,dpsim,expref]=apcluster(stag,p,'plot');

