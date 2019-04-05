%======================================================================
% Function ---- lagrangianInterpolation(t, dataPoints)
% Description - Computes the interpolated value of any point within the
%               range of the data points using the Lagrangian basis
%               functions.
% Arguments --- t: arbitrary value for which to calculate the value using
%               the Lagrange basis functions, which must fall within the
%               range of the data points.
%               data: dataPoints of the function, with the time values as a
%               2D vertical matrix of the form:
%               [time_1 data_1;
%                time_2 data_2;
%                    ...
%               time_n data_n]
% Returns ----- Interpolated value of the function
% Author ------ Tristan Bouchard
% Date -------- March 16, 2019
%======================================================================
function interpolationResult = lagrangianInterpolation(t, data)
    
    % Set initial value for the polynomial result.
    polynomial = 0;
    time = data(:,1);
    dataPoints = data(:,2);
    % Compute the lagrangian polynomial using all data points.
    len = length(dataPoints);
    for i = 1:(len)
        polynomial = polynomial + (dataPoints(i) * lagrangianWeight(t, i, time));
    end
    
    interpolationResult = polynomial;
    
end

