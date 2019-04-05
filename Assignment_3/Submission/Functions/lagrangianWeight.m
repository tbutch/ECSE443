%======================================================================
% Function ---- lagrangianWeight(x, j, data)
% Description - Computes the weight of the specified data point using the
%               Lagrange basis functions.
% Arguments --- t: time point for which to calculate the weight
%               j: Position for which to compute the weight function
%               time: All time points at which the function is calculated
% Returns ----- Weight of the data point
% Author ------ Tristan Bouchard
% Date -------- March 16, 2019
%======================================================================
function weight = lagrangianWeight(t, j, time)

    % Numerator of the Lagrangian basis function, set to one for the first
    % iteration
    topMult = 1;
    % Denominator of the Lagrangian basis function, set to one for the
    % first iteration
    bottomMult = 1;
    % Particular data point at which to compute the weight function. This
    % value forces the Lagrange basis function to be equal to zero if a
    % point other than the pivot is chosen to compute the weight for.
    pivot = time(j);

    for k = 1:length(time)
        if(k ~= j)
            topMult = topMult * (t - time(k));
            bottomMult = bottomMult * (pivot - time(k));
        end
    end
    weight = topMult/bottomMult;

end

