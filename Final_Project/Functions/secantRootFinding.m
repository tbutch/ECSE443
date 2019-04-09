%======================================================================
% Function ---- secantRootFinding(func)
% Description - Computes the roots of a function based on the secant
%               method
% Arguments --- func: The discrete function to which we are trying to 
%               calculate the roots, given as a data array
%               x0: Interval start
%               x1: Interval end
%               tol: Precision to which the roots must be computed
%               maxIterations: Maximum amount of iterations of main loop,
%               to avoid infinite looping due to badly defined start
%               boundaries
% Author ------ Tristan Bouchard
% Date -------- February 24, 2019
%======================================================================
function root = secantRootFinding(func, xCurr, xPrev, tol, maxIterations)
    time = func(:,1);
    % Obtain initial function value at previous time xPrev
    func_prev = func(time == xPrev);
    
    % Define maximum number of iterations
    iteration = 0;
    xNew = 0;
    top = double(xCurr - xPrev);
    while(abs(top) > tol || iteration < maxIterations)
        % We now already have the previous xPrev.
        % Just need to find the value of f(xCurr)!
        
        % Get index at which we can find the current value of the function
        dist = abs(time - xCurr);
        [~, curr_index] = min(dist);
        if(time(curr_index) - xCurr > 0)
           curr_index = curr_index - 1; 
        end
        
        % now that we have the index, compute the value of the function at
        % xCurr. May need to use interpolation, as the derivative is computed
        % at the time between the data points:
        topp = func(curr_index+1, 2) - func(curr_index, 2);
        div = time(curr_index+1) - time(curr_index);
        mult = xCurr - time(curr_index);
        funcCurrent = func(curr_index,2) + (topp/div)*mult;
        
        % Compute using the secant method
        top = double(xCurr - xPrev);
        if(top == 0)
            root = xNew;
            return
        else
            bottom = double(funcCurrent - func_prev);
            xNew = xCurr - funcCurrent*(top/bottom);
        end
        % Prepare variables for next iteration of loop
        xPrev = xCurr;
        xCurr = xNew;
        func_prev = funcCurrent;
        
        iteration = iteration + 1;
    end
    root = xNew;
end

