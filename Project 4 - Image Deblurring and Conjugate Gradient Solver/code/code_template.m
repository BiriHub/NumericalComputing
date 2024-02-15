close all;
clear; clc;

%% Exercise 3.2

% Validate Test values
load('test_data/A_test.mat');
load('test_data/x_test_exact.mat');
load('test_data/b_test.mat');


% Show the "b_test" blurred original image
figure
imagesc(reshape(b_test, [10, 10]), 'CDataMapping', 'scaled');
colormap(gray); 
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('Blurred image "b\_test"');

% Show the "x_test_exact" original image
figure
imagesc(reshape(x_test_exact, [10, 10]), 'CDataMapping', 'scaled');
colormap(gray); 
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('Original image "x\_test\_exact"');



%Initializing variables
A_matrix=A_test;
b_vector=b_test;
x0=ones(1,size(A_matrix,1))'; % vector of only 1's values
max_itr=maxItr;
tol=cutOff;

%Compute the Conjugate Gradient
[x,rvec] = myCG(A_matrix,b_vector,x0,max_itr,tol);

% Show the result of the system "Ax=b"
figure;
new_b=A_matrix*x;
imagesc(reshape(new_b, [10, 10]), 'CDataMapping', 'scaled');
colormap(gray);  
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('Blurred image obtained from "myCG" results');


% Show the deblurred "myCG" result image
figure;
imagesc(reshape(x, [10, 10]), 'CDataMapping', 'scaled');
colormap(gray);  
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('Deblurred image obtained from "myCG" results');


%Plot the convergence graph (residual value vs number of iteration)
figure;
semilogy(rvec, '-b');
title('Convergence Plot');
xlabel('Iteration');
ylabel('Residual value');


%% Exercise 3.3 

%Obtaine the eigenvalues of matrix "A_matrix"
eigevalues=eig(A_matrix);

%Plot the value of each eigenvalues of the matrix
figure;
bar(eigevalues);
set(gca, 'YScale', 'log');
title('Eigenvalues Plot');
xlabel('Value');
ylabel('Eigenvalue');

% compute the condition number of the matrix
min_eigenVal=min(eigevalues);
max_eigenVal=max(eigevalues);

% Compute the condition number of the matrix 'A_matrix'
cond_number=max_eigenVal/min_eigenVal;



%% Exercise 4 
clear all;

%% Exercise 4.1
%Load deblurring problem data
load('A.mat')
load('B.mat')


% Plot blurred initial picture 
figure;
imagesc(B, 'CDataMapping', 'scaled');
colormap(gray);  
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('Initilal blurred image');



% Compute "pcg" function results

%Setting the parameters
b=B(:); % vectorization of blurred image B
n=size(B,1);
max_iter=200;
tol=1e-10;


% Incomplete Cholensky factorial parameters

%pre-multiplication with A^T
A_positive=A'*A; % necessary to guarantee a positive-defined matrix 
b_positive=A'*b; 

options.type = 'nofill'; % incomplete Cholesky factor with zero-fill
options.diagcomp=0.01; % diagonal shift of 0.01 used to guarantee the existance of IC factor

%Compute the incomplete Cholesky factorization
IC_matrix = ichol(A_positive, options); 

%Execute the "pcg" function
[x,~,~,~,resid_vect]= pcg(A_positive,b_positive,tol,max_iter,IC_matrix,IC_matrix');

% Plot pcg results

% Plot the "pcg" function result 
figure;
imagesc(reshape(x, [n,n]), 'CDataMapping', 'scaled');
colormap(gray); 
axis equal; 
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('"pcg" result deblurred image');

% Plot the convergence graph of "pcg" result (residual values vs iterations number)

figure;
semilogy(resid_vect, '-b');
title('"pcg" convergence Plot');
xlabel('Iteration');
ylabel('Residual value');



% Compute "myCG" function result
x0=ones(1,size(A,1))'; % vector of only 1's values

%Execute the "myCG" function
[x,relres] = myCG(A_positive,b_positive,x0,max_iter,tol); % NOTE : the pre-multiplication is necessary to correctly plot the data

% Plot "myCG" result
figure;
imagesc(reshape(x, [n, n]), 'CDataMapping', 'scaled');
colormap(gray); 
axis equal;  
set(gca, 'XTick', []);
set(gca, 'YTick', []);
xlabel('"myCG" result deblurred image');

% Plot the convergence graph of "myCG" result (residual values vs iterations number)
figure;
semilogy(relres, '-b');
title('"myCG" convergence Plot');
xlabel('Iteration');
ylabel('Residual value');


