function comn_IdCoauthors = exerciseN8(authorName1,authorName2)
load('housegraph.mat', 'A')
load('housegraph.mat', 'name')

%% memorize the matrix index of the corresponding author name
coauthor1_index=findIndex(name,authorName1);
coauthor2_index=findIndex(name,authorName2);

%% return the row vector containing all coauthors of the specified authors
coauthors_1=A(coauthor1_index,:); 
coauthors_2=A(coauthor2_index,:);

%% it find the coautors in common, only the indexes
comn_IdCoauthors=coauthors_1 & coauthors_2;

%Remove the authors as coauthors between each others
comn_IdCoauthors(1,coauthor1_index)=0;
comn_IdCoauthors(1,coauthor2_index)=0;

%note : "comn_IdCoauthors" it is a matrix 1*n where n is the number of common
%coauthors between the two authors , each column of this matrix represents
%the index of coauthor

%print the name of common coauthors
fprintf("Common coauthors between \'%s\' and \'%s\' :\n",authorName1,authorName2);
for i=1:numel(comn_IdCoauthors)
    if(comn_IdCoauthors(1,i)==1)
    fprintf("%s\n",name(i,:));
    end

end

end

