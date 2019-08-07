%Objective function

function [fs] = s_objective_function (s , s0 , X, beta)


    Ns1 = norm( X * s0, 'fro').^2;
    Ns2 = norm(s0, 'fro').^2;

    
fs = beta * (norm( X * s0 - X * s , 'fro').^2) / Ns1  + (1-beta) * ( norm( s, 'fro').^2 / Ns2);

