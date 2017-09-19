function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%%---begin
h = X*theta;%X is m*n, theta is n*1, h is m*1
error = h-y;%error, h, y are m*1
error_sqr = error.^2;%error_sqr is m*1
J = sum(error_sqr)/(2*m);%J is scalar
%%---end

% =========================================================================

end
