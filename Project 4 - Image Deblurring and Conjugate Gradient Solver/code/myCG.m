function [x,rvec] = myCG(A,b,x0,max_itr,tol)
% The function computes the Conjugate Gradient Method

% A and b are the elements of the system Ax =b
% x0 is an initial vector
% max_itr represents the maximum number of iterations to do in the iteration
%method
% tol is the tollerance for which the convergence is reached in the iteration method 
% x is the solution value 
% rvec is the residual at every iteration



rvec = zeros(1, max_itr); %initilize the vector of residuals

%starting point
x = x0;
r = b - A*x;
p = r;
i=1;

while i<max_itr && norm(rvec(i))<tol
 
    scalar_prod_m=dot(r,r); % save the scalar product <r_m,r_m>
    alpha = scalar_prod_m / dot(A*p, p);         % alpha_m
    x = x + alpha * p;                      % x_m+1
    r = r - alpha * (A*p);                  %r_m+1


    beta = dot(r,r) / scalar_prod_m;
    p= r + beta * p;

    rvec(i) = dot(r,r); % save the residual of each iteraction
	
    i=i+1;
end