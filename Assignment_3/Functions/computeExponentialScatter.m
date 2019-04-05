%======================================================================
% Function ---- computeExponentialScatter(time, coefficients)
% Description - Compute the data points based on the coefficients and time
%               computed from the fit function
% Arguments --- time: scatter values associated with the time
%               coefficients: coefficients computed from normalized 
%               equations fit
% Returns ----- data points with time, to plot
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function scatterPoints = computeExponentialScatter(time, coefficients)
    data = zeros(length(time),1);
    % Stars at second time value, to avoid logarithmic errors
    for i = 1:length(time)
        data(i, 1) = coefficients(1,1)*time(i)^(coefficients(1,2));
    end
    dataWithTime = [time data];
    scatterPoints = dataWithTime;
end

