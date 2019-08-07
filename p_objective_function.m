%Objective function

function [fp] = p_objective_function (p , p0 , X, alpha)

% fp = alpha1 * p.' * kron(X,eye(M)) * kron(X.',eye(M)) * p + alpha2 * (p - p0).' * (p-p0);

    Np1 = norm(p0 * X, 'fro').^2;
    Np2 = norm(p0, 'fro').^2;
%     alpha1 = alpha / Np1;
%     alpha2 = (1-alpha) / Np2;
    
fp = alpha * (norm( p * X , 'fro').^2) / Np1  + (1-alpha) * ( norm( p - p0, 'fro').^2 / Np2);

