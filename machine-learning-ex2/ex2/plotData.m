function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

%%---begin
%store the indices of lines with y==1
positive = find(y==1);
%store the indices of lines with y==0
negative = find(y==0);
%1st param: value x
%2nd param: value y
%3rd param: marker style
%4th and 5th params: marker face color and value
%6th and 7th params: marker size and value
plot(X(positive,1),X(positive,2),'k+','LineWidth',2,'MarkerSize',7);
plot(X(negative,1),X(negative,2),'ko','MarkerFaceColor','y','MarkerSize',7);
%%---end

% =========================================================================



hold off;

end
