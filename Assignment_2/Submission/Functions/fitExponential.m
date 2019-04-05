%======================================================================
% Function ---- fitExponential(data)
% Description - Compute the coefficients for a fit based on an exponential
%               function of format f(t) = a0*t^(a1) for a and b
% Arguments --- data: data to be fit with exponential
% Returns ----- coefficients, [a,b] in a vector
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function coefficients = fitExponential(data)
    % Choose to omit the first data point, to remove logarithmic errors
    time = data(2:end,1);
    yValues = data(2:end,2);
    
    % Need to take logarithm of equation to linearize the equation
    % To obtain log(a0) + a1*log(t)
    yValuesLog = log(yValues);
    timeValuesLog = log(time);
    oneVector = ones(length(time), 1);
    A = [oneVector timeValuesLog];
    
    % solve the normalized system of equations according to the formula:
    a = (A'*A)\(A'*yValuesLog);
    coefficients = [exp(a(1,1)), a(2,1)];
end

