
%Testing the leastSquares function with the two inconsistent systems of
%Exercise 1

A1 = [1 0; 1 0; 1 0];
b1 = [5; 2; 4];

 [LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A1,b1);

LQ_solution
Euclid_norm
SE
RMSE

% final result 
% LQ_solution =
% 
%     3.6667
%        NaN
% Euclid_norm =
% 
%    NaN
% SE =
% 
%    NaN
% RMSE =
% 
%    NaN



% Define matrix A2 and vector b2
A2 = [1 1 0; 0 1 1; 1 2 1; 1 0 1];
b2 = [2; 2; 3; 4];

[LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A2,b2);


LQ_solution
Euclid_norm
SE
RMSE

% result

% LQ_solution =
% 
%     2.0000
%    -0.3333
%     2.0000
% 
% 
% Euclid_norm =
% 
%     0.5774
% 
% 
% SE =
% 
%     0.3333
% 
% 
% RMSE =
% 
%     0.2887
