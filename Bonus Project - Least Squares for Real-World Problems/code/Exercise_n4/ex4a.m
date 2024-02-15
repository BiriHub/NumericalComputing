
% Exercise 4.a

% considering the power law model : y_i = a_1 * x_i^a_2
% the corrisponging log-linearized model : ln(y_i) = ln(a_1) + a_2 * ln(x)

% the corrispective linear system of the log-linearized model is : 
% ln(y_i) = [1 ; ln(x)] * [k a_2] where k=ln(a_1)

%save the nuclear consumption data
[x_nuclear,y_nuclear]=dataNuclear();

% vector b initilization
b=log(y_nuclear); % calculate ln(y_i)

% Matrix A initilization 
A = [ones(length(x_nuclear), 1), log(x_nuclear)];

%Calculate the least squares solutions
[LQ_solution,~,~,RMSE] = leastSquares(A,b);


% Now , I calculate the RMSE for the power law model
% the exponential model : y_i = a_1 * x_i^a_2

%translating the log-linearized model to the exponential one
A_exp=exp(LQ_solution(1))*(x_nuclear.^(LQ_solution(2)));
b_exp=y_nuclear;

[~,~,~,RMSE_exp] = leastSquares(A_exp,b_exp);

% Print of RMSE metrics
fprintf('RMSE of log-linearized model : %f\n RMSE of exponential model : %f\n', RMSE,RMSE_exp);
