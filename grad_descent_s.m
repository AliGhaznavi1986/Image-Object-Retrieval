function [sopt,fsopt,niter,gnorm,ds] = ...
    grad_descent_s(s0 , X, beta, varargin)

% termination tolerance
tol = 1e-6;

% maximum number of allowed iterations
maxiter = 2000;

% minimum allowed perturbation
dsmin = 1e-4;

% step size ( 0.33 causes instability, 0.2 quite accurate)
eta = 0.6;

% initialize gradient norm, optimization vector, iteration counter, perturbation
gnorm = inf; s = s0; niter = 0; ds = inf;

% define the objective function:
% f = @(x1,x2) x1.^2 + x1.*x2 + 3*x2.^2;

% plot objective function contours for visualization:
% figure(1); clf; ezcontour(f,[-5 5 -5 5]); axis equal; hold on

% redefine objective function syntax for use with optimization:
% f2 = @(x) f(x(1),x(2));

% gradient descent algorithm:
while and(gnorm>=tol, and(niter <= maxiter, ds >= dsmin))
    
    disp(niter)
    % calculate gradient:
%     g = grad(p);
      grads = s_Gradient_Obj_func (s , s0 , X, beta);

    gnorm = norm(grads);
    % take step:
    snew = s - eta*grads;
    % check step
    if ~isfinite(snew)
        display(['Number of iterations: ' num2str(niter)])
        error('s is inf or NaN')
    end
    % plot current point
%     plot([x(1) xnew(1)],[x(2) xnew(2)],'ko-')
%     refresh
    % update termination metrics
    niter = niter + 1;
    ds = norm(snew-s);
    s = snew;
    disp(ds)
    
end
sopt = s;
fsopt = s_objective_function (s , s0 , X, beta);
niter = niter - 1;