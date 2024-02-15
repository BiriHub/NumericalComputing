%exercise n°9
load('housegraph.mat', 'A')
load('housegraph.mat', 'name')

%pagerank1_mod is an edited version of pagerank1.m file in which it does not need the 'U' parameter
ranking= pagerank1_mod(A,0.85);

% Sort authors by PageRank in descending order
[sorted_pageRank_val,sorted_indices] = sort(ranking, 'descend');

sorted_names = name(sorted_indices, :);

%generate a graph of all authors in descending order according to the
%Pagerank valeus
figure;
ylabel('PageRank values');
xlabel('Authors names');
title('Authors by PageRank (Descending Order)');
bar(sorted_pageRank_val);
set(gca, 'XTick', 1:numel(sorted_names), 'XTickLabel', sorted_names);



