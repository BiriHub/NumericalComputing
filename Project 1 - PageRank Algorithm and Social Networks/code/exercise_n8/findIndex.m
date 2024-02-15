%This function returns the index of the author name (formatted as a char
%array) given the matrix in which it has to search
%if there is a match, the function will return the index of the
%name, otherwise it will return 0

function index = findIndex(matrix,nameCharArr)
%initialize 'index' equals to 0
index=0;

for i=1:size(matrix,1) %scroll the matrix rows
    if strncmp(matrix(i,:),nameCharArr,numel(nameCharArr))
        index=i;
        break;
    end
end

end

