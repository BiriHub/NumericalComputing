% Cluster 2D real-world graphs with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

  load airfoil1.mat
 % load grid2.mat
 % load barth.mat
 % load 3elt.mat

% Specify the number of clusters
K = 2;

% Read graph
W   = Problem.A;
Pts = Problem.aux.coord;
n   = size(Pts,1);


figure;
spy(W)
title('Adjacency matrix')

%% 2.1) Create the Laplacian matrix and plot the graphs using the 2nd and 3rd eigenvectors


for i =1:4
    if(i==1)
        load airfoil1.mat
    elseif(i==2)
        load grid2.mat
    elseif(i==3)
        load barth.mat
    else
        load 3elt.mat
    end

    % Read graph
    W   = Problem.A;
    Pts = Problem.aux.coord;
    n   = size(Pts,1);
    

    %Create the Laplacian matrix
    [L,~] = CreateLapl(W);
    
    % returns the 3 smallest eigevalues , and their corrispective eigevectors, of the Laplacian matrix L
    num_eigenvalues=3;
    [V,~]=eigs(L,num_eigenvalues,1e-6);

    
    % Plot and compare
    figure;
    subplot(1,2,1);
    gplot(W,Pts)
    xlabel('Nodal coordinates')
    subplot(1,2,2);
    gplot(W,V(:,2:3))
    xlabel('Plot using Eigenvector coordinates')

    pause;
    close all;

       
end



%% 2.2) Cluster each graph in K = 4 clusters with the spectral and the 
%      k-means method, and compare your results visually for each case.

K=4;

for i =1:4
    if(i==1)
        load airfoil1.mat
    elseif(i==2)
        load grid2.mat
    elseif(i==3)
        load barth.mat
    else
        load 3elt.mat
    end

    % Read graph
    W   = Problem.A;
    Pts = Problem.aux.coord;
    n   = size(Pts,1);
    
    %Create the Laplacian matrix
    [L,~] = CreateLapl(W);
    
    % returns the K=4 smallest eigevalues , and their corrispective eigevectors, of the Laplacian matrix L
    [V,~]=eigs(L,K,1e-6);
    
    %spectral clustering
    [D_spec,x_spec]= kmeans_mod(V,K,n);
    
    %K-means clustering
    [D_kmeans,x_kmeans] = kmeans_mod(Pts(:,1:2),K,n);
    
    % Compare and visualize
    figure;
    subplot(1,2,1);
    gplotmap(W,Pts,x_spec)
    title('Plot the spectral clusters')
    subplot(1,2,2);
    gplotmap(W,Pts,x_kmeans)
    title('Plot the K-means clusters')

    
    %% 2.3) Calculate the number of nodes per cluster
    if(i>1)
        [Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,x_spec,x_kmeans);
    end
    
    pause;
    close all;
end

