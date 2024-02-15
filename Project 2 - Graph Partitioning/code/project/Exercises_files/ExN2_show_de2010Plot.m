
%Exercise 2
%Visualize the results for p=8 and p=16 for the case "de-2010"

load 'de2010.mat'

W = Problem.A;
coords = Problem.aux.coord;    

[map,~,p]=rec_bisection("bisection_spectral",3,W,coords,0);%
%graph
gplotg(W,coords);

%8-way graph 
gplotmap(W,coords,map);

[map,~,p]=rec_bisection("bisection_spectral",4,W,coords,0);%

%16-way graph
gplotmap(W,coords,map);
