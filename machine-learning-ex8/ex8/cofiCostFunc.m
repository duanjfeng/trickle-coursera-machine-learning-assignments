function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

%%---begin
%1. calculate J without regularization
%Theta is nu*nf matrix, user features
%X is nm*nf matrix, movie features
%Y is nm*nu matrix
%R is nm*nu matrix
j1=1/2*sum(sum(((X*Theta'-Y).*R).^2));
%Theta(:,2:end) or %X(:,2:end) is wrong
%we are not specifying bias units in the collaborative filtering algorithm,
%https://www.coursera.org/learn/machine-learning/resources/wpvzt
j2=lambda/2*sum(sum((Theta.^2)));
j3=lambda/2*sum(sum((X.^2)));
J=j1+j2+j3;

%2. calculate X_grad, nm*nf matrix
for i=1:num_movies
 %idx, all users rated movie i, size ur(users rated)
 idx=find(R(i,:)==1);
 %ThetaTemp, user features related to movie i, ur*nf matrix
 ThetaTemp=Theta(idx,:);
 %YTemp, movie i ratings, 1*ur
 YTemp=Y(i,idx);
 %1*nf row
 part1=(X(i,:)*ThetaTemp'-YTemp)*ThetaTemp;
 %regularization
 part2=lambda*X(i,:);
 %X_grad(i,:) is 1*nf row
 X_grad(i,:)=part1+part2;
end

%3. calculate Theta_grad, nu*nf matrix
for j=1:num_users
 %idx, all movies reted by j, size mr(moives rated)
 idx=find(R(:,j)==1);
 %XTemp, moive features related to user j, mr*nf
 XTemp=X(idx,:);
 %YTemp, user j ratings, mr*1
 YTemp=Y(idx,j);
 %1*nf row
 part1=(Theta(j,:)*XTemp'-YTemp')*XTemp;
 %regularization
 part2=lambda*Theta(j,:);
 %Theta_grad(j,:) is 1*nf row
 Theta_grad(j,:)=part1+part2;

%%---end

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
