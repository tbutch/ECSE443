%======================================================================
% Function ---- integralTrapezoidal(func, variable, lowerBound, upperBound)
% Description - Computes the definite integral of a specified function
%               using the discrete Trapezoidal method.
% Arguments --- func: The function to which we are trying to calculate the
%               integral, given as a function handle
%               lowerBound: Lower bound of the definite integral
%               upperBound: Upper bound of the definite integral
%               trueValue: True value of the integral, for precision
%               precision: Desired precision
% Author ------ Tristan Bouchard
% Date -------- March 20, 2019
%======================================================================
function [computedValue, intervals] = integralTrapezoidal(func, lowerBound, upperBound, trueValue, precision)
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
            % Compute the Trapezoidal value of the bound
            trapVal = ((ub - lb)/2) * (func(ub) + func(lb));
            sum = sum + trapVal;
        end
        
        error = relativeError(trueValue, sum);
        divisions = divisions+1;
        computedValue = sum;
        intervals = intervalEnds;
    end
end

