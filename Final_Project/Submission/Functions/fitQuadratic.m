%======================================================================
% Function ---- fitQuadratic(time, data)
% Description - Calculate the coefficients of a quadratic fit function
% Arguments --- data: scatter values associated with the time
% Returns ----- coefficient vector
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function [coefficient_vector] = fitQuadratic(data)
    time = data(:,1);
    timeSquared = time.^2;
    yValues = data(:,2);
    oneVector = ones(length(time),1);

    % Form A matrix
    A = [oneVector time timeSquared];

    % solve the normalized system of equations according to the formula:
    a = (A'*A)\(A'*yValues);
    coefficient_vector = a;
end

