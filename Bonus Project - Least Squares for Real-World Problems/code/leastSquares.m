function [LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A,b)
% Calculate the least squares solution "LQ_solution" of a inconsistent system

% Generic system : Ax = b

% A : matrix
% b : vector 
LQ_solution= (A'*A)\(A'*b); % calculate the least square solution

%% Computing the residual vector r 
r= b-A*LQ_solution;


r_norm=norm(r); % Calculate the norm of the residual vector

%% Computing Euclidean norm of the residual
Euclid_norm = r_norm;

%% Computing the SE
SE=r_norm ^2;

%% Computing the RMSE

m= size(A,1); % memorize the number of equations contained in the system

RMSE = sqrt(SE/m);


end