function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%%---begin
%X is m*n
%Theta1 is s2*(n+1), s2 is 25, n is 400
%Theta2 is num_labels*(s2+1), num_labels is 10, s2 is 25
n=size(X,2);
s2=size(Theta1,1);
%add one col to X, so X is m*(n+1)
X=[ones(m,1) X];
%a1 is m*(n+1), n+1 is 401
a1=X;
%z2, a2 is m*s2
z2=X*Theta1';
a2=sigmoid(z2);
%add one col to a2, so a2 is m*(s2+1)
a2=[ones(m,1) a2];
%z3, a3 is m*num_labels
z3=a2*Theta2';
%sigmoid is monotone increasing, choosing max z is the same as max h
%so we will not calculate a3
[val,p] = max(z3,[],2);
%%---end

% =========================================================================


end
