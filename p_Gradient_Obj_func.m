%Gradient of Objective function

function [Gf] = p_Gradient_Obj_func (p , p0 , X, alpha)

    Np1 = norm(p0 * X, 'fro').^2;
    Np2 = norm(p0, 'fro').^2;
% Gf = 2 * ( alpha1 * kron(X,eye(M)) * kron(X.',eye(M)) * p + alpha2 * (p - p0));
Gf = 2 * ( (alpha / Np1)  * (p * (X * X.')) + ((1-alpha) / Np2) * (p - p0));