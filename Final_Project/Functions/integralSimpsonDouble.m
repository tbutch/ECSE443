%======================================================================
% Function ---- integralSimpsonDouble(func, variable, lowerBoundX,
%               upperBoundX, lowerBoundY, upperboundY, trueValue, precision,
%               stepStart) 
% Description - Computes the definite double integral of a
%               specified function using the discrete Simpson method.
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
% Date -------- March 22, 2019
%======================================================================
function [computedValue, intervalsX] = integralSimpsonDouble(func, lowerBoundX, ...
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
            midX = ((ubX + lbX)/2);
            
            % Then, integrate in Y
            rangeUpY = upperBoundY(ubX) - lowerBoundY(ubX);
            rangeMidY = upperBoundY(midX) - lowerBoundY(midX);
            rangeLoY = upperBoundY(lbX) - lowerBoundY(lbX);
            intervalLengthHiY = rangeUpY/divisionsX;
            intervalLengthMidY = rangeMidY/divisionsX;
            intervalLengthLoY = rangeLoY/divisionsX;
            
            intervalEndsUpY = lowerBoundY(ubX): intervalLengthHiY: upperBoundY(ubX);
            intervalEndsMidY = lowerBoundY(midX): intervalLengthMidY: upperBoundY(midX);
            intervalEndsLoY = lowerBoundY(lbX): intervalLengthLoY: upperBoundY(lbX);
            
            innerSum = 0;
            for j = 1:(divisionsX)
                % Compute the endpoints of the box in y
                lbY1 = intervalEndsLoY(j);
                ubY1 = intervalEndsLoY(j+1);
                lbY2 = intervalEndsMidY(j);
                ubY2 = intervalEndsMidY(j+1);
                lbY3 = intervalEndsUpY(j);
                ubY3 = intervalEndsUpY(j+1);
                
                % (f(a)+4f((a+b)/2)+f(b))(b?a)/6
                % Compute the trapezoidal value of the box
                trapArea1 = intervalLengthX*intervalLengthLoY;
                trapArea2 = intervalLengthX*intervalLengthMidY;
                trapArea3 = intervalLengthX*intervalLengthHiY;
                
               % Compute the trapezoidal value of the box
                func11 = func(lbX, lbY1);
                func12 = func(lbX, ubY1);
                func13 = func(lbX, (lbY1 + ubY1)/2);
                func21 = func(midX, lbY2);
                func22 = func(midX, ubY2);
                func23 = func(midX, (lbY2 + ubY2)/2);
                func31 = func(ubX, lbY3);
                func32 = func(ubX, ubY3);
                func33 = func(ubX, (lbY3 + ubY3)/2);
                funcVal = trapArea1*(func11 + func12 + 4*func13) + ...
                          4*trapArea2*(func21 + func22 + 4*func23) + ...
                          trapArea3*(func31 + func32 + 4*func33);
                simpVal = funcVal/36;
                innerSum = innerSum + simpVal;
            end
            outerSum = outerSum + innerSum;
        end
        disp("For " + double(divisionsX) + " divisions, the integral = " + double(outerSum));
        error = absoluteError(trueValue, outerSum);
        disp("With an absolute error of " + error);
        divisionsX = divisionsX+1;
        toc
    end
    computedValue = outerSum;
    intervalsX = intervalEndsX;
end

