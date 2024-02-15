function [part1,part2] = bisection_inertial(A,xy,picture)

% 1. Calculate the center of mass.
%Coordinates are the following
x_centerMass = sum(xy(:,1)) / size(xy, 1);
y_centerMass = sum(xy(:,2)) / size(xy, 1);


% 2. Construct the matrix M.
M = zeros(2, 2);

%Calculate S_xx
M(1,1) = sum(xy(:,1)-x_centerMass)^2 ; 

%Calculate S_xy
y_diff=xy(:,2)-y_centerMass;
x_diff=xy(:,1)-x_centerMass;
M(1,2) = sum(x_diff.*y_diff) ;
M(2,1) = M(1,2);

%Calculate S_yy
M(2,2) = sum(xy(:,2)-y_centerMass)^2 ;
 
% 3. Calculate the smallest eigenvector of M.  

%returns the smallest eigevalues, and its corrispective eigevector, of the matrix L
[V,~]=eigs(M,1,1e-6); 
u_vector=V(:,1);

%gets 2 first values of smallest eigenvector
u_vector=u_vector(1:2); 
a=u_vector(1); %u1
b=u_vector(2); %u2


% 4. Find the line L on which the center of mass lies.
% 5. Partition the points around the line M.

%[b,-a] = Orthogonal vector to vector [a,b]

[part1,part2] = partition(xy,[b,-a]);

% % <<<< Dummy implementation to generate a partitioning
% n   = size(A,1);
% map = zeros(n,1);
% map(1:round((n/2)))     = 0; 
% map((round((n/2))+1):n) = 1;
% [part1,part2] = other(map);


if picture == 1
    gplotpart(A,xy,part1);
    title('Inertial bisection');
end
 
end
