% Benchmark for recursively partitioning meshes, based on various
% bisection approaches
%
% D.P & O.S for Numerical Computing at USI

% add necessary paths
addpaths_GP;
nlevels_a = 3;
nlevels_b = 4;

fprintf('       *********************************************\n')
fprintf('       ***  Recursive graph bisection benchmark  ***\n');
fprintf('       *********************************************\n')

% load cases
cases = {
     'mesh1e1.mat',
     'bodyy4.mat',
     'de2010.mat',
     'biplane-9.mat',
     'L-9.mat',
    };

nc = length(cases);
maxlen = 0;
for c = 1:nc
    if length(cases{c}) > maxlen
        maxlen = length(cases{c});
    end
end

for c = 1:nc
    fprintf('.');
    sparse_matrices(c) = load(cases{c});
end


fprintf('\n\n Report Cases         Nodes     Edges\n');
fprintf(repmat('-', 1, 40));
fprintf('\n');
for c = 1:nc
    spacers  = repmat('.', 1, maxlen+3-length(cases{c}));
    [params] = Initialize_case(sparse_matrices(c));
    fprintf('%s %s %10d %10d\n', cases{c}, spacers,params.numberOfVertices,params.numberOfEdges);
end

%% Create results table
fprintf('\n%7s %16s %20s %16s %16s\n','Bisection','Spectral','Metis 5.0.2','Coordinate','Inertial');
fprintf('%10s %10d %6d %10d %6d %10d %6d %10d %6d\n','Partitions',8,16,8,16,8,16,8,16);
fprintf(repmat('-', 1, 100));
fprintf('\n');


for c = 1:nc
    spacers = repmat('.', 1, maxlen+3-length(cases{c}));
    fprintf('%s %s', cases{c}, spacers);
    sparse_matrix = load(cases{c});
    

    % Recursively bisect the loaded graphs in 8 and 16 subgraphs.
    % Steps
    % 1. Initialize the problem
    [params] = Initialize_case(sparse_matrices(c));
    W      = params.Adj;
    coords = params.coords;    
	
	
    % 2. Recursive routines
	% 3. Calculate number of cut edges
	
    %%i. Spectral    
 
    [~,sepij,~]=rec_bisection("bisection_spectral",3,W,coords,0);%
    cutedges_8way_spectral=size(sepij, 1);

    [~,sepij,~]=rec_bisection("bisection_spectral",4,W,coords,0);%
    cutedges_16way_spectral=size(sepij, 1);

    %%ii. Metis

    [~,sepij,~]=rec_bisection("bisection_metis",3,W,coords,0);%
    cutedges_8way_metis=size(sepij, 1);

    [~,sepij,~]=rec_bisection("bisection_metis",4,W,coords,0);%
    cutedges_16way_metis=size(sepij, 1);

    % iii. Coordinaates

    [~,sepij,~]=rec_bisection("bisection_coordinate",3,W,coords,0);%
    cutedges_8way_coordinate=size(sepij, 1);

    [~,sepij,~]=rec_bisection("bisection_coordinate",4,W,coords,0);%
    cutedges_16way_coordinate=size(sepij, 1);
	
    % iv. Inertial

    [~,sepij,~]=rec_bisection("bisection_inertial",3,W,coords,0);%
    cutedges_8way_inertial=size(sepij, 1);

    [~,sepij,~]=rec_bisection("bisection_inertial",4,W,coords,0);%
    cutedges_16way_inertial=size(sepij, 1);
	

    % 4. Visualize the partitioning result

    fprintf('%6d %6d %10d %6d %10d %6d %10d %6d\n',...
    cutedges_8way_spectral,cutedges_16way_spectral,...
	cutedges_8way_metis,cutedges_16way_metis,...
    cutedges_8way_coordinate,cutedges_16way_coordinate,...
    cutedges_8way_inertial,cutedges_16way_inertial);
   

end