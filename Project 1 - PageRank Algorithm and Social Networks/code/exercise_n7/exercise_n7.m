%esercizio 7
load('housegraph.mat', 'A')
load('housegraph.mat', 'name')

G=graph(A);


% Calculate degree centrality for each author in the graph
deg_Centrality = degree(G);

% Sorting of the authors by degree centrality in descending order
[sort_DegreCentrality, nodeIndices] = sort(deg_Centrality, 'descend');

% Get the top 5 authors with the highest degree centrality
top5Authors = nodeIndices(1:5);

% print all required information about the top 5 authors with the higher
% degree centrality in the graph
fprintf('Top 5 Nodes with Highest Degree Centrality:\n');
for i = 1:numel(top5Authors)
    coauthors=find(A(top5Authors(i),:)) ; %% search for all the coauthors of the top i-th author position

    %print the authors , id + name
    fprintf('Author name : %s\n',name(top5Authors(i),:));

    %print the coauthors of the author ----------------------
    fprintf('Coauthors of the author : %s\n', name(top5Authors(i),:));


    for j=1:numel(coauthors)
        %remove the author as coauthor
        if coauthors(j)~=top5Authors(i)
        fprintf("- %s\n",name(coauthors(j),:));
        end
    end
    
    fprintf('Degree centrality of the author: %d\n\n',sort_DegreCentrality(i)-1);
    

end
%Print the top five authors
top5Authors

