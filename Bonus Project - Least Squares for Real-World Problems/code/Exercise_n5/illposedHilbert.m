%Exercise 5.b

rng('default');

n_values = [50, 100, 200, 300, 400, 500, 1000];

% Initialize arrays to store results so as to plot them later
condition_numbers_list = zeros(size(n_values)); %(I) array of condition values 
error_norms_list = zeros(size(n_values));       %(II) array of errors norms

% Loop every values of n contained in "n_values"
for i = 1:length(n_values)
    n = n_values(i);
    
    % Generate Hilbert matrix
    H = hilb(n);
    
    % Calculate condition number of H
    condition_numbers_list(i) = cond(H);

    % Generate x_exact and b
    x_exact = rand(n, 1);
    
    %Calculate b
    b = H * x_exact;
    
    % Solve the ill-posed problem Hx = b
    x = H \ b;
    
    % Calculate the norm of the error
    error_norms_list(i) = norm(x_exact - x, 2);
end

% Plot results
figure;

%Plot the condition number of H against n
subplot(2, 1, 1);
plot(n_values, condition_numbers_list, '-o');
xlabel('n value');
ylabel('Condition Number of H');
title('Condition Number of H against n');

subplot(2, 1, 2);
plot(n_values, error_norms_list, '-o');
xlabel('n value');
ylabel('Norm of the error');
title('||x_{exact} - x||_2 against n');
