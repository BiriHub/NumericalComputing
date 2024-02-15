
% Exercise 4.b
%Levenberg-Marquardt Algorithm application

% Set the random seed for reproducibility
rng(10); 


%save the nuclear consumption data
[x_nuclear,y_nuclear]=dataNuclear();

% vector b initilization
b=log(y_nuclear); % calculate ln(y_i)

% Matrix A initilization 
A = [ones(length(x_nuclear), 1), log(x_nuclear)];

[LQ_solution,~,~,RMSE] = leastSquares(A,b);

%translating the log-linearized model to the exponential one
A_exp=[exp(LQ_solution(1))*(x_nuclear.^(LQ_solution(2)))];




%% Levenberg-Marquardt method 

[x_nuclear,y_nuclear]=dataNuclear();

lambda=0;

%Used to generate a random number between two values
min_val=1;
max_val=x_nuclear(end); % x_nuclear(end) = 8;

rand_1 = min_val + (max_val - min_val) * rand;
rand_2 = min_val + (max_val - min_val) * rand;

alpha=[rand_1,rand_2]';

x_result = levenbergMarquardt(alpha, lambda, x_nuclear,y_nuclear);

r= b-A*LQ_solution;
m= size(A,1); % memorize the number of equations contained in the system
RMSE_leven = sqrt((norm(x_result)^2)/m); % calculate the RMSE of the least square solution obtained from the levenberg-Margquardt


A_leven=[x_result(1)*(x_nuclear.^(x_result(2)))];



figure;
plot(x_nuclear, y_nuclear, '-o', 'DisplayName', 'Original Data');
hold on;

% Plot the power law model on the same figure
plot(x_nuclear, A_exp, '-r', 'DisplayName', 'Power Law Model');

% Plot the Levenberg-Marquardt power law model on the same figure
plot(x_nuclear, A_leven, '-g', 'DisplayName', 'Levenberg Power Law Model');


% Customize the plot
title('Model comparison for nuclear power consumption');
xlabel('Interval');
ylabel('Power consumption');
legend('Original Data', 'Power Law Model','Levenberg Power Law Model');
grid on;
hold off;

% print the RMSE of the least square solution obtained from the levenberg-Marquardt
fprintf('RMSE of Levenberg-Marquardt application: %f\n', RMSE_leven);
