%======================================================================
% Function ---- fitInverse(time, data)
% Description - Calculate the coefficients of a inverse fit function
% Arguments --- data: scatter values associated with the time
% Returns ----- coefficient vector
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function coefficient_vector = fitInverse(data)
    time = data(:,1);
    
    yValuesInverse = 1./data(:,2);
    oneVector = ones(length(time),1);

    % Form A matrix
    A = [oneVector time];

    % solve the normalized system of equations according to the formula
    a = (A'*A)\(A'*yValuesInverse);
    coefficient_vector = a;
end

