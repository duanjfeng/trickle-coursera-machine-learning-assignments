function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%

%%---begin
%randperm will gen a 1-m rand value row, e.g. randperm(3) will gen '2,3,1'
randidx=randperm(size(X,1));
%get first K examples
centroids=X(randidx(1:K),:);
%%---end

% =============================================================

end

