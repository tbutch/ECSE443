%======================================================================
% Function ---- newtonRootFinding(func)
% Description - Computes the roots of a function based on the secant
%               method
% Arguments --- func: The symbolic function in which we are trying to find
%               a root
%               xStart: Interval Start
%               tol: Precision to which the roots must be computed
%               maxIterations: Maximum amount of iterations of main loop,
%               to avoid infinite looping due to badly defined start
%               boundaries
% Author ------ Tristan Bouchard
% Date -------- February 24, 2019
%======================================================================
function root = newtonRootFinding(func,xStart, tol, maxIterations)
    currentIteration = 0;
    funcDerivative = diff(func);
    while(currentIteration < maxIterations)
        
        % Compute new value, based on the equation in the slides.
        xNew = xStart - (func(xStart)/funcDerivative(xStart));
        
        % Is our result within tolerance range?
        if(xNew-xStart < tol)
           root = xNew;
           return
        end
        
        currentIteration = currentIteration + 1;
        %Reset variables for next iteration
        xStart = xNew;
        
    end
end

