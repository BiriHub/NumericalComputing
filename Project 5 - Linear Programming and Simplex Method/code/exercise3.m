% Define the type of problem
type = 'max';

% Define the matrix A for constraints coefficients
A = [4 3; 4 1; 4 2];

% Define the right-hand side vector h
h = [12; 8; 8];

% Define the vector for signs of the constraints
sign = [-1; -1; -1]; 

% Define the coefficients of the objective function
c = [3, 4]; 

% Call the custom simplex method
[z, x_B, index_B] = simplex(type, A, h, c, sign);


%% the "simplex" function call return the error :
% "Incorrect loop, more iterations than the number of basic solutions"