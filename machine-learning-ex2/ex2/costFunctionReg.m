function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%%---begin
%define n, features size or theta size
n = size(theta);
%define z, X is m*n, theta is n*1, z is m*1
z = X*theta;

%calculate J
%part 1, the same as no-regularized
j1 = -1/m*(y'*log(sigmoid(z)));
%part 2, the same as no-regularized
j2 = -1/m*((1-y')*log(1-sigmoid(z)));
%part 3, regularized, should skip theta(1)
j3 = lambda/(2*m)*theta(2:n)'*theta(2:n);
J = j1+j2+j3;

%calculate gradient, grad is n*1
%part 1, the same as no-regularized
grad = 1/m*X'*(sigmoid(z)-y);
%part 2, regularized, should skip theta(1)
grad(2:n) = grad(2:n)+lambda/m*theta(2:n);
%%---end

% =============================================================

end
