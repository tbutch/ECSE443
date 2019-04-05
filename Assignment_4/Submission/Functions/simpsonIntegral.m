%======================================================================
% Function ---- integralSimpson(func, variable, lowerBound, upperBound)
% Description - Computes the definite integral of a specified function
%               using the discrete Simpson method.
% Arguments --- func: The function to which we are trying to calculate the
%               integral, given as a symbolic expression.
%               lowerBound: Lower bound of the definite integral
%               upperBound: Upper bound of the definite integral
%               trueValue: True value of the integral, for precision
%               precision: Desired precision
% Author ------ Tristan Bouchard
% Date -------- March 20, 2019
%======================================================================
function [computedValue, intervals] = simpsonIntegral(func, lowerBound, upperBound, trueValue, precision)
    % Set starting error value
    error = 1;
    % Set starting amounts for function
    divisions = 1;
    range = upperBound - lowerBound;
    while (abs(error) > precision)
        
        % First, subdivide the integration area into smaller areas.
        intervalLength = range/divisions;
        intervalEnds = [lowerBound: intervalLength:upperBound];
        
        % Create for loop, to iterate through intervals'
        sum = 0;
        for i = 1:(length(intervalEnds)-1)
            lb = intervalEnds(i);
            ub = intervalEnds(i+1);
            % Compute the Simpson value of the bound
            simpVal = ((ub - lb)/6) * (func(ub) + func(lb) + 4*func((ub+lb)/2));
            sum = sum + simpVal;
        end
        
        error = relativeError(trueValue, sum);
        divisions = divisions+1;
        computedValue = sum;
        intervals = intervalEnds;
    end
end

