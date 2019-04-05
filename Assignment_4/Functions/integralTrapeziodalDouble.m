%======================================================================
% Function ---- integralTrapeziodalDouble(func, lowerBoundX, ...
%               upperBoundX, lowerBoundY, upperBoundY, trueValue, precision)  
% Description - Computes the definite double integral of a
%               specified function using the discrete Trapeziodal method.
%               This algorithm divides up the area into squares of
%               decreasing size to gain precision.
% Arguments --- func: The function to which we are trying to calculate the
%               integral, given as a symbolic expression.
%               lowerBoundX: Lower bound of the definite integral in x
%               upperBoundX: Upper bound of the definite integral in x
%               lowerBoundY: Function handle of the lower bound of y
%               upperBoundY: Function handle of the upper bound of y
%               trueValue: True value of the integral, for precision
%               precision: Desired precision
% Returns ----- computedValue: Computed value of the integral
%               intervalsX: Intervals in X used to compute the integral
% Author ------ Tristan Bouchard
% Date -------- March 20, 2019
%======================================================================
function [computedValue, intervalsX] = integralTrapeziodalDouble(func, lowerBoundX, ...
    upperBoundX, lowerBoundY, upperBoundY, trueValue, precision, stepStart)
    
    % Set up starting error value
    error = 1;
    % Set starting amounts for function
    divisionsX = stepStart;
    rangeX = upperBoundX - lowerBoundX;
    
    while (abs(error) > precision)
        % First, subdivide the integration area into smaller areas.
        intervalLengthX = rangeX/divisionsX;
        % Compute X and Y endpoints for the intervals
        intervalEndsX = lowerBoundX: intervalLengthX: upperBoundX;

        % Integrate in X first
        outerSum = 0;
        tic
        for i = 1:(divisionsX)
            
            lbX = intervalEndsX(i);
            ubX = intervalEndsX(i+1);
            % Then, integrate in Y
            rangeUpY = upperBoundY(ubX) - lowerBoundY(ubX);
            rangeLoY = upperBoundY(lbX) - lowerBoundY(lbX);
            intervalLengthHiY = rangeUpY/divisionsX;
            intervalLengthLoY = rangeLoY/divisionsX;
            
            intervalEndsUpY = lowerBoundY(ubX): intervalLengthHiY: upperBoundY(ubX);
            intervalEndsLoY = lowerBoundY(lbX): intervalLengthLoY: upperBoundY(lbX);
            innerSum = 0;
            for j = 1:(divisionsX)
                % Compute the endpoints of the box in y
                lbY1 = intervalEndsLoY(j);
                ubY1 = intervalEndsLoY(j+1);
                lbY2 = intervalEndsUpY(j);
                ubY2 = intervalEndsUpY(j+1);
                
                % Compute the trapezoidal value of the box
                trapArea1 = intervalLengthX*intervalLengthLoY;
                trapArea2 = intervalLengthX*intervalLengthHiY;
                func11 = func(lbX, lbY1);
                func12 = func(lbX, ubY1);
                func21 = func(ubX, lbY2);
                func22 = func(ubX, ubY2);
                funcVal = (1/4)*(trapArea1*(func11 + func12) + trapArea2*(func21+func22));
                innerSum = innerSum + funcVal;
            end
            outerSum = outerSum + innerSum;
        end
        disp("For " + double(divisionsX) + " divisions, the integral = " + double(outerSum));
        error = absoluteError(trueValue, outerSum);
        disp("With an absolute error of " + error);
        divisionsX = divisionsX+3;
        toc
    end
    computedValue = outerSum;
    intervalsX = intervalEndsX;
end

