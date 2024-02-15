function [cut_recursive,cut_kway] = Bench_metis(picture)
% Compare recursive bisection and direct k-way partitioning,
% as implemented in the Metis 5.0.2 library.
%
% D.P & O.S for Numerical Computing at USI


%  Add necessary paths
addpaths_GP;

% Graphs in question
% load 'helicopter.mat' ;
% load 'skirt.mat';

% Steps
% 1. Initialize the cases
% 2. Call metismex to
%     a) Recursively partition the graphs in 16 and 32 subsets.
%     b) Perform direct k-way partitioning of the graphs in 16 and 32 subsets.
%da% 3. Visualize the results for 32 partitions


%helicopter case
load helicopter.mat

W = Problem.A;
coords = Problem.aux.coord;  
figure;
gplotg(W,coords);


%16 - recursive bisection
[map,edgecut] = metismex('PartGraphRecursive',W,16);
%Print the number of edge cuts
edgecut

%16-way direct partition
[map,edgecut] = metismex('PartGraphKway',W,16);
%Print the number of edge cuts
edgecut

%32- recursive bisection
[map,edgecut] = metismex('PartGraphRecursive',W,32);
%Print the number of edge cuts
edgecut

figure;

gplotmap(W,coords,map);

%32-way direct partition
[map,edgecut] = metismex('PartGraphKway',W,32);
%Print the number of edge cuts
edgecut

figure;

gplotmap(W,coords,map);


%skirt case
load skirt.mat

W = Problem.A;
coords = Problem.aux.coord; 

figure;

gplotg(W,coords);

%16 - recursive bisection
[map,edgecut] = metismex('PartGraphRecursive',W,16);
%Print the number of edge cuts
edgecut

%16-way direct partition
[map,edgecut] = metismex('PartGraphKway',W,16);
%Print the number of edge cuts
edgecut

%32- recursive bisection
[map,edgecut] = metismex('PartGraphRecursive',W,32);
%Print the number of edge cuts
edgecut


figure;

gplotmap(W,coords,map);

%32-way direct partition
[map,edgecut] = metismex('PartGraphKway',W,32);
%Print the number of edge cuts
edgecut

figure;

gplotmap(W,coords,map);


end
