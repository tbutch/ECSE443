%======================================================================
% Function ---- LUfactorization(coefficientMatrix)
% Description - Compute Lower and Upper triangular matrices using LU
%               factorization
% Arguments --- coefficientMatrix: Square matrix with coefficients
% Returns ----- LMatrix - Lower Triangular Matrix
%               UMatrix - Upper Triangular Matrix
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function [LMatrix,UMatrix] = LUfactorization(coefficientMatrix)
n = length(coefficientMatrix);
% Initialize matrices: Make U equivalent to the coefficient matrix, and L
% the identity matrix
U = coefficientMatrix;
L = eye(n);

% Iterate over columns, then rows
for j = 1:n-1
    for i = j + 1 : n
        multipliers = (U(i,j)/U(j, j));
        L(i,j) = multipliers;
        U(i, j:n) = U(i,j:n) - multipliers*U(j,j:n);
    end   
end
LMatrix = L;
UMatrix = U;

end

