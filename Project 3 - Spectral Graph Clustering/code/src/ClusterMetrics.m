function [Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,x_spec,x_kmeans)
%% METRICS
Spec_nodes   = 0;
Kmeans_nodes = 0;

histy_numNodes=zeros(K,1);
histx_numCluster=zeros(K,1);

 % 2c) Calculate the number of nodes per cluster (for k-means and spectral
 %     clustering) and plot them in a histogram.

 for i=1:K
 Spec_nodes =size(find(x_spec==i),1) % gets and prints on terminal the number of nodes
 histy_numNodes(i)=Spec_nodes;
 histx_numCluster(i)=i;
 end


figure;
subplot(1,2,1);

 % Create an histogram
bar(histx_numCluster, histy_numNodes);

title('Spectral clustering'); % add title
xlabel('K clusters'); % label x axis
ylabel('Nodes number'); % label y axis



 for i=1:K
 Kmeans_nodes =size(find(x_kmeans==i),1) % gets and prints on terminal the number of nodesv
 histy_numNodes(i)=Kmeans_nodes;
 histx_numCluster(i)=i;
 end

subplot(1,2,2);
bar(histx_numCluster, histy_numNodes);
title('K-means clustering'); % add title
xlabel('K clusters'); % label x axis
ylabel('Nodes number'); % label y axis

 
end