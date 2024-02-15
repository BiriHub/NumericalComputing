function [part1,part2] = bisection_spectral(A,xy,picture)

% 1. Construct the Laplacian matrix.
D = diag(sum(A));
L = D - A;

% 2. Calculate its eigensdecomposition

% returns the 2 smallest eigevalues , and their corrispective eigevectors, of the Laplacian matrix L
[V,~]=eigs(L,2,1e-6); % NOTE : 'smallestabs' throws the 'badly scaled error' in my case . 
					  % An alternative solution is to define a threshold like '1e-6'

feidler_vector=V(:,2); 


% 3. Label the vertices with the components of the Fiedler vector.
feidler_median=median(feidler_vector,"all"); %threshold


% 4. Partition them around their median value, or 0.
part1=find(feidler_vector<feidler_median);
part2=find(feidler_vector>=feidler_median);

% % <<<< Dummy implementation to generate a partitioning
% n   = size(A,1);
% map = zeros(n,1);
% map(1:round((n/2)))     = 0; 
% map((round((n/2))+1):n) = 1;
% [part1,part2] = other(map);
% 

%Print the plot
if picture == 1
    gplotpart(A,xy,part1);
    title('Spectral bisection using the Fiedler Eigenvector');
end


end