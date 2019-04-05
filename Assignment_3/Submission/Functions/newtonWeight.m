%======================================================================
% Function ---- newtonWeight(t, j)
% Description - Computes the weight of the specified data point using the
%               Lagrange basis functions. This method is taken out of the
%               textbook, and is described on page 318.
% Arguments --- t: time point for which to calculate the weight
%               j: Position for which to compute the weight function
%               time: All time points at which the function is calculated
% Returns ----- Weight of the data point
% Author ------ Tristan Bouchard
% Date -------- March 16, 2019
%======================================================================
function weight = newtonWeight(t, j, time)
    mult = 1;
    % Notice the iteration limits, it is necessary to specify for which j
    % the weight needs to be calculated
    for k = 1:(j-1)
        mult = mult * (t - time(k));
    end
    weight = mult;
end


