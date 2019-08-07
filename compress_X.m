function [XC,idx] =  compress_X(X)

j = 1;

for i = 1:size(X,2)
  
    if(nnz(X(:,i)) ~= 0)
        
       XC(:,j) = X(:,i);
       idx(j) = i;
       j = j + 1;
    end
    
end
    