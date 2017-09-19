function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%%---begin
%denominator, can be a matrix
denominator = 1+exp(-z);
%wise-element
g = 1 ./ denominator;
%%---end

% =============================================================

end
