function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

%%---begin
k=num_labels;
%y is m*1 vector, ymatrix is m*k, in ymatrix each y is a vector
ymatrix=(1:k)==y;

%%1.feedforward calculation
%calculate h, h is a3
%X is m*n, a1 is m*(n+1), Theta1 is s2*(n+1)
%a1 is one col added to X
a1=[ones(m,1) X];
%z2, a2 is m*s2
z2=a1*Theta1';
a2=sigmoid(z2);
%add one col to a2, so a2 is m*(s2+1), Theta2 is k*(s2+1)
a2=[ones(m,1) a2];
%z3, a3 is m*k
z3=a2*Theta2';
a3=sigmoid(z3);

%%2. cost function without regularization
%calculate part1, j1 is m*k
j1=-1/m*ymatrix .* log(a3);
%calculate part2, j2 is m*k
j2=-1/m*(1-ymatrix) .* log(1-a3);
%(j1+j2) is a matrix with size m*k
%J is sum of all elements of m*k matrix
J=sum((j1+j2)(:));

%%3. cost function with regularization
%calculate part3, regularized part
%removing first col of Theta1 get t1, t1 is s2*n
t1=Theta1(:,2:end);
%removing first col of Theta2 get t2, t2 is k*s2
t2=Theta2(:,2:end);
%j3 is scalar
j3=lambda/(2*m)*(sum((t1 .* t1)(:))+sum((t2 .* t2)(:)));
J=J+j3;

%%4. backpropagation, gradient function without regularization
%delta3 is m*k as a3 and y both are m*k
delta3=a3-ymatrix;
%delta2 is m*s2 as delta3 is m*k, t2 is k*s2, z2 is m*s2
delta2=(delta3*t2).*sigmoidGradient(z2);
%DELTA2 is k*(s2+1), as delta3 is m*k, a2 is m*(s2+1)
DELTA2=delta3'*a2;
%DELTA1 is s2*(n+1), as delta2 is m*s2, a1 is m*(n+1)
DELTA1=delta2'*a1;
%D2 is k*(s2+1)
D2=DELTA2/m;
%D1 is s2*(n+1)
D1=DELTA1/m;

%%5. gradient function with regularization
%D2 regularized, k*(s2+1), the first col keep unchanged
D2(:,2:end)=D2(:,2:end)+lambda/m*Theta2(:,2:end);
%D1 regularized, s2*(n+1), the first col keep unchanged
D1(:,2:end)=D1(:,2:end)+lambda/m*Theta1(:,2:end);

Theta2_grad=D2;
Theta1_grad=D1;

%%--end

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
