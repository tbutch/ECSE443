%======================================================================
% Function ---- absoluteError(trueValue,computedvalue)
% Description - Computes the relative error between two values
% Arguments --- trueValue: Real reference value
%               computedValue: Computed value to observe against true value
% Author ------ Tristan Bouchard
% Date -------- March 20, 2019
%======================================================================
function relError = relativeError(trueValue, computedValue)
    absError = computedValue - trueValue;
    relError = absError/trueValue;
end

