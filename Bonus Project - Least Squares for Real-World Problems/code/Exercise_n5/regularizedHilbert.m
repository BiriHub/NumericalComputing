
%Exercise 5.c

rng('default');

n = 100;

alpha_values = logspace(-10, 1, 10); % Choose 10 different values of alpha

a_numValues=size(alpha_values,1);   
% Initialize arrays to store results so as to plot them later
error_norms_alpha = zeros(a_numValues);  %(I) array of errors norms || x_exact-x_reg||_2
residual_norms = zeros(a_numValues);     %(II) array of norm ||H*x -b||_2 
x_reg_norm_arr=zeros(a_numValues);       %(II) array of x_reg norms ||x_reg||_2

% Generate Hilbert matrix
H = hilb(n);

% Generate x_exact and b
x_exact = rand(n, 1);

%Calculate b
b = H * x_exact;

% Loop over different values of alpha
for i = 1:length(alpha_values)
    alpha = alpha_values(i);
    
    % Solve the regularized problem using Tikhonov regularization
    x_reg = (H' * H + alpha * eye(n)) \ (H' * b);
    
    % Calculate the norm of the error
    error_norms_alpha(i) = norm(x_exact - x_reg, 2);
    
    % Calculate the norm ||H*x_reg -b||_2
    residual_norms(i) = norm(H * x_reg - b, 2);
    
    %Calculate the norm ||x_reg||_2
    x_reg_norm_arr(i)=norm(x_reg,2);

end

% Plot results
figure;
subplot(2, 1, 1);
loglog(alpha_values, error_norms_alpha, '-o');
xlabel('\alpha values');
ylabel('Norm of the error'); 
title('|| x_{exact}-x_{reg}||_2 against \alpha');

subplot(2, 1, 2);
loglog(x_reg_norm_arr,residual_norms, '-o');
xlabel('Norm of x_{reg}');
ylabel('Residual Norm');
title('||H*x_{reg} -b||_2 against ||x_{reg}||_2');
