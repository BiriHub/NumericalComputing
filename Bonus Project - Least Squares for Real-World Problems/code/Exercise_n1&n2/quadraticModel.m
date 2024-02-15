% Exercise 2.c

% considering the quadratic model : y_i = a_1 +a_2*x_i+a_3*(x_i)^2
% the corrispective linear system is : y_i = [1 ; x_i ; (x_i)^2] * [a_1 ; a_2,a_3]

%% crude oil production data

%save the crude oil production data
[x_oil,y_oil]=dataCrudeOil();


% remove the data associated to the year 2012
n=size(x_oil,1); % limit the range between 1980-2011
y_oil=y_oil(1:n-1,1); 
x_oil=x_oil(1:n-1,1);

% vector b initilization
b=y_oil(:,1);

% Matrix A initilization 
A = [ones(length(x_oil), 1), x_oil,x_oil.^2];

%Calculate the least squares solutions
[LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A,b);

%Plot the data
figure;

plot(x_oil, y_oil, '-o','DisplayName','Original Data');

hold on;

%Plot the model 
plot(x_oil, A * LQ_solution, '-r', 'DisplayName', 'Quadratic Model');

% Plot customization
title('Quadratic Model for Crude Oil Production');
xlabel('Year');
ylabel('Production');
legend('Original Data', 'Quadratic Model');
grid on;
hold off;

% print the estimated result for the year 2012
LQ_solution(1) +LQ_solution(2)*2012+LQ_solution(3)*(2012).^2

%% kerosene production data

%save the kerosene production data
[x_kerosene,y_kerosene]=dataKerosene();

% remove the data associated to the year 2012

n=size(x_kerosene,1); % limit the range between 1980-2011
y_kerosene=y_kerosene(1:n-1,1);
x_kerosene=x_kerosene(1:n-1,1);

% vector b initilization
b=y_kerosene(:,1);


% Matrix A initilization 
A = [ones(length(x_kerosene), 1), x_kerosene,x_kerosene.^2];

%Calculate the least squares solutions
[LQ_solution,Euclid_norm,SE,RMSE] = leastSquares(A,b);

%Plot the data
figure;
plot(x_kerosene, y_kerosene, '-o','DisplayName','Original Data');

hold on;

%Plot the model 
plot(x_kerosene, A * LQ_solution, '-r', 'DisplayName', 'Quadratic Model');

% Plot customization
title('Quadratic Model for Kerosene Production');
xlabel('Year');
ylabel('Production');
legend('Original Data', 'Quadratic Model');
grid on;
hold off;

% print the estimated result for the year 2012
LQ_solution(1) +LQ_solution(2)*2012+LQ_solution(3)*(2012).^2