
% Define the type of problem 
type = 'max';

% Define the matrix A for constraints coefficients
A = [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0; 
     0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0; 
     0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0; 
     0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1; 
     320, 0, 0, 0, 510, 0, 0, 0, 630, 0, 0, 0, 125, 0, 0, 0; 
     0, 320, 0, 0, 0, 510, 0, 0, 0, 630, 0, 0, 0, 125, 0, 0; 
     0, 0, 320, 0, 0, 0, 510, 0, 0, 0, 630, 0, 0, 0, 125, 0; 
     0, 0, 0, 320, 0, 0, 0, 510, 0, 0, 0, 630, 0, 0, 0, 125; 
     1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 
     0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0; 
     0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0; 
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1];

% Define the right-hand side vector h
h = [18; 32; 25; 17; 11930; 22552; 11209; 5870; 16; 32; 40; 28];

% Define the vector for signs of the constraints
sign = [-1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1; -1];

% Define the coefficients of the objective function
c = [135, 135*1.1, 135*1.2, 135*1.3, 200, 200*1.1, 200*1.2, 200*1.3, 410, 410*1.1, 410*1.2, 410*1.3, 520, 520*1.1, 520*1.2, 520*1.3];

% Call the custom simplex method
[z, x_B, index_B] = simplex(type, A, h, c, sign); % Uncomment this line after defining the simplex function

% Computations for the graphical representation
x=zeros(16,1);
for i = 1:16
    idx = find(index_B == i);
    if ~isempty(idx) 
        x(i) = x_B(idx); % if the index is contained in the "index_B" array save the respective result in x
    end
end

x_matrix = reshape(x, [4, 4]);

% Graphical representation of results using bar charts
figure;
bar(x_matrix, 'stacked');
title('Cargo Distribution in Compartments');
xlabel('Compartment');
ylabel('Cargo Amount');
legend({'C1', 'C2', 'C3', 'C4'}, 'Location', 'bestoutside');

% Reshape c to a 4x4 matrix to match x_matrix
c_matrix = reshape(c, [4, 4]);

% Calculate profit for each compartment
profit = c_matrix .* x_matrix; % Element-wise multiplication

% Graphical representation of profit
figure;
bar(profit,'stacked');
title('Profit Distribution in Compartments');
xlabel('Compartment');
ylabel('Profit (CHF)');
legend({'C1', 'C2', 'C3', 'C4'}, 'Location', 'bestoutside');

