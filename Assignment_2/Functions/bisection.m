%======================================================================
% Function ---- bisection(func, a, b, numRoots)
% Description - Computes the roots of a function based on the bisection
%               method
% Arguments --- func: The function to which we are trying to calculate the
%               roots, given as a symbolic expression
%               a: Interval start
%               b: Interval end
%               tol: Precision to which the roots must be computed
%               numRoots: number of expected roots, based on function
%               degree
% Author ------ Tristan Bouchard
% Date -------- February 23, 2019
%======================================================================
function roots = bisection(func, a, b, tol, numRoots)
    syms x;
    if(sign(double(func(b))) == sign(double(func(a))))
        roots = "Wrong choice of interval, please try another";
    else
        % For each of the three roots
        funcRoots = zeros(numRoots,1);
        rootIndex = 1;
        while(rootIndex<numRoots)
            while ((b-a) > tol)
                m = a + (b-a)/2;
                % To retain as much precision as possible without having to rely on
                % symbolic values, i use the double() function when computing the result
                % of the symbolic function
                if(sign(double(func(a))) == sign(double(func(m))))
                    a = m;
                else
                    b = m;
                end  
            end
            funcRoots(rootIndex, 1) = m;
            
            % Verify if root is repeated in this position by using the diff
            % function to verify the amplitude of the step
            difference = diff(func);
            % While this difference is less than the precision required,
            % compute the difference function again.
            while(double(difference(m)) <  tol/100)
                rootIndex = rootIndex + 1;
                funcRoots(rootIndex,1) = m;
                difference = diff(difference);
                % Remove root from function, by dividing symbolic function
                % by its equivalent pole, as explained here: 
                % https://www.mathworks.com/matlabcentral/answers/281980-finding-multiple-roots-of-a-polynomial
                func = func/(x-func(m));
            end
        end
        roots = funcRoots;
    end
end

