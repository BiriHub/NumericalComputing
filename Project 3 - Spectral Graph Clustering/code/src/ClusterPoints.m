% Cluster 2D pointclouds with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

% Specify the number of clusters
K = 2;

%% 1.1) Get coordinate list from pointclouds

% Coords used in this script
Pts = halfkernel();
figure;
scatter(Pts(:,1),Pts(:,2))
title('Coordinates of half kernel');

n = size(Pts,1);


%% 1.2) Find the minimal spanning tree of the full graph. Use the information to determine a valid value for epsilon        

% Create Gaussian similarity function
[S] = similarityfunc(Pts(:,1:2),exp(K)); % create the S matrix which represents the full similarity matrix constructed using the Gaussian similarity function 
										 % NOTE : I used 'exp(K)' because ,in my case , the creation of the graph structure appeared sparsed and during the nodes clustering operation did not occur correctly.
										 % You can normally leave empty the function parameter or pass 'log(n)'

% Create the mininum spanning tree of the matrix S
matrix_minimum_spanning_tree=minSpanTree(S);

% Obtain the epsilon the length of the longest edge in the minimum spanning tree

% Use max to find the maximum value in the full matrix
epsilon = max(matrix_minimum_spanning_tree,[],"all");%longest edge in the minimum spanning tree

%% 1.3) Create the epsilon similarity graph

[G] = epsilonSimGraph(epsilon,Pts);


%% 1.4) Create the adjacency matrix for the epsilon case 

W=S.*G;

%Graph visualization
figure;
gplotg(W,Pts(:,1:2))

title('Adjacency matrix for the epsilon similarity graph')
pause;
close all;


%% 1.5) Create the Laplacian matrix and implement spectral clustering

%Create the Laplacian matrix
[L,~] = CreateLapl(W);

% returns the K=2 smallest eigevalues , and their corrispective eigevectors, of the Laplacian matrix L
[V,~]=eigs(L,K,1e-6);

%spectral clustering
[D_spec,x_spec]= kmeans_mod(V,K,n); 

%Graph visualization
figure;
gplotmap(W,Pts,x_spec)
title('Spectral clustering');

%% 1.6) Run K-means on input data

[D_kmeans,x_kmeans] = kmeans_mod(Pts(:,1:2),K,n);

%Create the Spectral clusters plot
figure;
subplot(1,2,1)
gplotmap(W,Pts(:,1:2),x_spec)
title('Plot the spectral clusters');

%Create the K-means clustering plot
subplot(1,2,2)
gplotmap(W,Pts(:,1:2),x_kmeans)
title('Plot the K-means clusters');

pause;
hold off;
close all;

%% 1.7) Visualize spectral and k-means clustering results
K=2;
datasets={twospirals(),clusterincluster(),crescentfullmoon(),corners(),outlier()};
close all;

for i =1:numel(datasets)
    if(i==4)
        K=4; 
    end

    Pts=datasets{i};
    n = size(Pts,1);

    [S] = similarityfunc(Pts(:,1:2),exp(K));
    matrix_minimum_spanning_tree=minSpanTree(S);

    epsilon = max(matrix_minimum_spanning_tree,[],"all");

    [G] = epsilonSimGraph(epsilon,Pts);

    W=S.*G;

    %Create the Laplacian matrix
    [L,~] = CreateLapl(W);
    [V,~]=eigs(L,K,1e-6);

    [D_spec,x_spec]= kmeans_mod(V,K,n); 


    [D_kmeans,x_kmeans] = kmeans_mod(Pts(:,1:2),K,n);

    % the Spectral clusters plot
    figure;
    subplot(1,2,1)
    gplotmap(W,Pts(:,1:2),x_spec)
    title('Plot the spectral clusters');

    %the K-means clustering plot
    subplot(1,2,2)
    gplotmap(W,Pts(:,1:2),x_kmeans)
    title('Plot the K-means clusters'); 

    pause;
    close all;


end


