%Gradient of Objective function

function [Gs] = s_Gradient_Obj_func (s , s0 , X, beta)

    Ns1 = norm( X * s0, 'fro').^2;
    Ns2 = norm(s0, 'fro').^2;
    
Gs = 2 *  (-(beta / Ns1) * (X.' * X) * (s0 - s) + ((1-beta) / Ns2) * s );