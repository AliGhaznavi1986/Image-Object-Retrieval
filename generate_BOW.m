function [BOW] = generate_BOW (index,params)

BOW = int8(zeros(params.maxImgsForVocab, params.numWords));
j = 1;
for i = 1:params.numWords
res = int8(zeros(params.maxImgsForVocab, 1));
cont = index.vw2imgsList{1,i};
keys = cont.keys;
keys = [keys{:}];
vals = cont.values;
vals = [vals{:}];
res(keys) = vals;
BOW(:,j) = res;
disp(j)
% res = sparse(res);
j = j+1;
end
fprintf('saving BOW matrix in (%s) directory!',params.resDir);
save(fullfile(params.resDir, 'BOW.mat'), 'BOW', '-v7.3');
