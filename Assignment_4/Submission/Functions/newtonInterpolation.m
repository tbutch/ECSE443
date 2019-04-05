%======================================================================
% Function ---- newtonInterpolation(t, coefficients, dataPoints)
% Description - Computes the interpolated value of any point within the
%               range of the data points using the Newton basis functions
% Arguments --- t: arbitrary value for which to calculate the value using
%               the Lagrange basis functions, which must fall within the
%               range of the data points.
%               coefficients: Coefficients computed by thte
%               newtonCoefficients function, used for the basis polynomial.
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
function interpolatedValue = newtonInterpolation(t, coefficients, dataPoints)
    
    time = dataPoints(:,1);
    data = dataPoints(:,2);
    
    % Compose matrix of weight function
    weightMat = zeros(length(time),1);
    % Fill in matrix of weight function
    for i = 1:length(time)
       weightMat(i) = newtonWeight(t, i, time); 
    end
    interpolatedValue = coefficients' * weightMat;
end

