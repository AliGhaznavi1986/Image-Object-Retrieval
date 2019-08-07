function R = NNormalize_BO(BOW)

 for i = 1: size(BOW,1)
    % L-1 normalize
    z = sum(BOW(i), 2);   % sumation all of each column
    s = (z + (z == 0)); % chek each parametr is zero or not - if out input is zero z==0 turn to 1
    BOW(i,:) = BOW(i,:)/s;
    
    % square root each element
 end
 
   R = sqrt(BOW);

end
