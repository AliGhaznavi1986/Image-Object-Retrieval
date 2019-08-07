function [popt,fopt,niter,gnorm,dp] = ...
    grad_descent_p(p0 , X, alpha, varargin)

% termination tolerance
tol = 1e-6;

% maximum number of allowed iterations
maxiter = 2000;

% minimum allowed perturbation
dpmin = 1e-6;

% step size ( 0.33 causes instability, 0.2 quite accurate)
eta = 0.6;

% initialize gradient norm, optimization vector, iteration counter, perturbation
gnorm = inf; p = p0; niter = 0; dp = inf;

% define the objective function:
% f = @(x1,x2) x1.^2 + x1.*x2 + 3*x2.^2;

% plot objective function contours for visualization:
% figure(1); clf; ezcontour(f,[-5 5 -5 5]); axis equal; hold on

% redefine objective function syntax for use with optimization:
% f2 = @(x) f(x(1),x(2));

% gradient descent algorithm:
while and(gnorm>=tol, and(niter <= maxiter, dp >= dpmin))
    
    disp(niter)
    % calculate gradient:
%     g = grad(p);
      gradp = p_Gradient_Obj_func (p , p0 , X, alpha);

    gnorm = norm(gradp);
    % take step:
    pnew = p - eta*gradp;
    % check step
    if ~isfinite(pnew)
        display(['Number of iterations: ' num2str(niter)])
        error('p is inf or NaN')
    end
    % plot current point
%     plot([x(1) xnew(1)],[x(2) xnew(2)],'ko-')
%     refresh
    % update termination metrics
    niter = niter + 1;
    dp = norm(pnew-p);
    p = pnew;
    disp(dp)
    
end
popt = p;
fopt = p_objective_function (p , p0 , X, alpha);
niter = niter - 1;