function x = levenbergMarquardt(initial_alpha, lambda, x_data,y_data)
    
    % Levenberg-Marquardt function
    
    % Given a random initial guess x and a regularization parameter lambda
    
    % Initialize variables
    x = initial_alpha;

    tolerance= 1e-6;
   
    i=1;
    x_k=0;
    
    %iterative method
     while norm(x-x_k,2)>= tolerance && i<100 
        x_k=x;

        alpha1=x(1);    
        alpha2=x(2);
        
        % compute the residual vector 'r' 
        r=alpha1*x_data.^(alpha2)-y_data;

        %  Jacobian matrix 
        A= [x_data.^alpha2 , x_data.^(alpha2).*alpha1.*log(x_data)]; 
        
        
        % Compute vector v
        
        B = A'*A;
        
        v = -((B + lambda * diag(B)) \ (A.' * r));
        
        if(isnan(v))
            break;
        end

        % Update the parameter vector x(i+1)
        x = x + v;
        i=i+1;
     end

end