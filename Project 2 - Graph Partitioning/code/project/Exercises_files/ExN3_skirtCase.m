
%skirt case
load 'skirt.mat'

W = Problem.A;
coords = Problem.aux.coord;   

%16 - recursive bisection
[map16GraphRec,edgecut] = metismex('PartGraphRecursive',W,16);
%Print the number of edge cuts
edgecut

%16-way direct partition
[map16GraphKway,edgecut] = metismex('PartGraphKway',W,16);
%Print the number of edge cuts
edgecut

%32- recursive bisection
[map32GraphRec,edgecut] = metismex('PartGraphRecursive',W,32);
%Print the number of edge cuts
edgecut
%32-way direct partition
[map32GraphKway,edgecut] = metismex('PartGraphKway',W,32);
%Print the number of edge cuts
edgecut
