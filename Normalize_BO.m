function R = Normalize_BO(D)
    
    % L-1 normalize
    z = sum(D, 2);   % sumation all of each column
    s = (z + (z == 0)); % chek each parametr is zero or not - if out input is zero z==0 turn to 1
    D = D ./ repmat(s, 1, size(D, 2)); % erxpend matrix S from  1. n to 128 . n
    
    % square root each element
    R = sqrt(D);
    
end
