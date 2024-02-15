function [G] = epsilonSimGraph(epsilon,Pts)
% Construct an epsilon similarity graph
% Input
% epsilon: size of neighborhood (calculate from Prim's Algorithm) 
% Pts    : coordinate list of the sample 
% 
% Output
% A      : the epsilon similarity matrix
% 
% USI, ICS, Lugano
% Numerical Computing

fprintf('----------------------------\n');
fprintf('epsilon similarity graph\n');
fprintf('----------------------------\n');


n = size(Pts, 1);
G = zeros(n, n); % Initialize the similarity matrix with zeros

for i = 1:n
    for j = 1:n
        % Calculate the Euclidean distance between points i and j
        dist = norm(Pts(i, :) - Pts(j, :),2);

        % Check if the distance is less than epsilon
        if dist <= epsilon
            G(i, j) = 1;
            G(j, i) = 1;
        end
    end
end





% \----------------------------/

end