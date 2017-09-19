function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

%%---begin
%%1. calculate J
%n is num of feature
%diff is vector with m*1, X is m*n, theta is n*1, y is m*1
diff=X*theta-y;
%part one of J, which is not regularized, j1 is scalar
j1=1/(2*m)*(diff'*diff);
%part two of J, which is regularized part, j2 is scalar
t=theta(2:end);
j2=lambda/(2*m)*(t'*t);
J=j1+j2;

%%2. calculate gradient
%part one of gradient, n*1, which is not regularized
grad1=1/m*(X'*diff);
grad=grad1;
%part two of gradient, (n-1)*1, which is regularized
grad2=lambda/m*theta(2:end);
grad(2:end)=grad(2:end)+grad2;
%%---end

% =========================================================================

grad = grad(:);

end
