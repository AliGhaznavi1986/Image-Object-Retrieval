
% 
run('./vlfeat/toolbox/vl_setup');
name = 'vlfeat';
fprintf('%s is running as first toolbox.\n',name);
run('./vlg/toolbox/vlg_setup');
name = 'vlg';
fprintf('%s is running as second toolbox.\n',name);
params.imgsDir = 'C:\Users\Dixpm\Documents\MATLAB\data\1K';
name = 'imgsDir';
fprintf('%s initialed .\n',name);
params.resDir = 'C:\Users\Dixpm\Documents\MATLAB\AVW\model\model140k';
name = 'resDir';
params.tagDir = 'C:\Users\Dixpm\Documents\MATLAB\data\11K\info_Flickr11K\';
params.clusterDir = 'C:\Users\Dixpm\Documents\MATLAB\AVW\model\clusters\';
fprintf('%s initialed .\n',name);
params.numWords = 140000;
name = 'numWords';
fprintf('%s initialed with (%d) .\n',name,params.numWords);
params.maxImgsForVocab = 1000;
name = 'maxImgsForVocab';
fprintf('%s initialed with (%d) .\n',name,params.maxImgsForVocab);

