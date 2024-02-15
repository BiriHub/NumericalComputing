
% Exercise 3.a

% considering the periodic model : 
% y_i = a_1+a_2*cos(2*pi*x_i)+a_3*sin(2*pi*x_i)
% the corrispective linear system is : y_i = [1 ; cos(2*pi*x_i) ; sin(2*pi*x_i)] * [a_1 ; a_2; a_3]
 

%% (I) between January 1960 and January 1963

%save the temperature data
[x_temp,y_temp]=temperatureData(1960,1963,2);


% vector b initilization
b=y_temp(:,1);

% Matrix A initilization 
A = [ones(size(x_temp,1), 1), cos(2*pi*x_temp),sin(2*pi*x_temp)];

%Calculate the least squares solutions
[LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A,b);

% Plot original data
figure;
plot(x_temp, y_temp, '-o', 'DisplayName', 'Original Data');
ylabel('Temperature');
hold on;

% Plot periodic model
plot(x_temp, A*LQ_solution, '-r', 'DisplayName', 'Periodic Model');
ylabel('Periodic Model');

title('Periodic Model for Temperature Data');
xlabel('Year');
legend('Original Data', 'Periodic Model');
grid on;
hold off;

%% (II) between January 1960 and January 1970

%save the temperature data
[x_temp,y_temp]=temperatureData(1960,1970,2);

% vector b initilization
b=y_temp(:,1);

% Matrix A initilization 
A = [ones(length(x_temp), 1), cos(2*pi*x_temp),sin(2*pi*x_temp)];

%Calculate the least squares solutions
[LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A,b);

% Plot original data
figure;
plot(x_temp, y_temp, '-o', 'DisplayName', 'Original Data');
ylabel('Temperature');

hold on;

% Plot periodic model on a separate y-axis
plot(x_temp, A*LQ_solution, '-r', 'DisplayName', 'Periodic Model');
ylabel('Periodic Model');

title('Periodic Model for Temperature Data');
xlabel('Year');
legend('Original Data', 'Periodic Model');
grid on;
hold off;

