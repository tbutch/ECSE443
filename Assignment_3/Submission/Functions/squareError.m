%======================================================================
% Function ---- squareError(originalData, fitData)
% Description - Computes square error between original data and fit data
% Arguments --- originalData: The data to which the fit is done
%               fitData: Data computed from the fitment coefficients
% Returns ----- Square error
% Author ------ Tristan Bouchard
% Date -------- February 23, 2019
%======================================================================
function error = squareError(originalData, fitData)
    error = sum((originalData(:,2) - fitData(:,2)).^2);
end

