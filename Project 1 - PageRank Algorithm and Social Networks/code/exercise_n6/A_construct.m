function [matrix_A,nz] = A_construct(n)

% Initialize the matrix A with zeros
matrix_A=zeros(n);

% Fill in the entries according to the given properties
for i = 1:n
    for j = 1:n
        if i==j
            matrix_A(i, j) = n + i - 1;
        elseif i == 1 || i == n || j == 1 || j == n
            matrix_A(i, j) = 1;
        end
    end
end
% counts Non-zeros values
nz=nnz(matrix_A);
end

