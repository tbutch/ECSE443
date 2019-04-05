%======================================================================
% Function ---- integralMidPointDouble(func, variable, lowerBoundX,
%               upperBoundX, lowerBoundY, upperboundY, trueValue, precision,
%               stepStart) 
% Description - Computes the definite double integral of a
%               specified function using the discrete Mid-point method.
% Arguments --- func: The function to which we are trying to calculate the
%               integral, given as a symbolic expression.
%               lowerBoundX: Lower bound of the definite integral in x
%               upperBoundX: Upper bound of the definite integral in x
%               lowerBoundY: Function handle of the lower bound of y
%               upperBoundY: Function handle of the upper bound of y
%               trueValue: True value of the integral, for precision
%               precision: Desired precision
%               stepStart: Desired starting number of slices
% Author ------ Tristan Bouchard
% Date -------- March 21, 2019
%======================================================================
function [computedValue, intervalsX] = integralMidPointDouble(func, lowerBoundX, ...
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
        x = lowerBoundX;
        outerSum = 0;
        tic
        for i = 1:(divisionsX)
            
            lbX = intervalEndsX(i);
            ubX = intervalEndsX(i+1);
            % Then, integrate in Y
            y = lowerBoundY((lbX+ubX)/2);
            rangeY = upperBoundY((lbX+ubX)/2) - y;
            intervalLengthY = rangeY/divisionsX;
            intervalEndsY = lowerBound((lbX+ubX)/2):intervalLengthY:upperBoundY((lbX+ubX)/2);
            innerSum = 0;
            for j = 1:(divisionsX)
                % Compute the endpoints of the box in y
                lbY = intervalEndsY(j);
                ubY = intervalEndsY(j+1);
                
                % Compute the midpoint value of the box
                boxArea = (intervalLengthX)*(intervalLengthY);
                xMidPt = ((lbX+ubX)/2);
                yMidPt = ((lbY+ubY)/2);
                funcVal = func(xMidPt,yMidPt);
                midPtVal = boxArea*funcVal;
                innerSum = innerSum + midPtVal;
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

