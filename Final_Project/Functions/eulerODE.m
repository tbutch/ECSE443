%======================================================================
% Function ---- fitQuadratic(time, data)
% Description - Calculate the datapoints of an ODE using the Euler method
% Arguments --- y0: Value of the function at t = 0
%               yPrime0: Value of the derivative of the function at t=0
%               time: The time values for which to compute the data points
% Returns ----- data points to ODE
% Author ------ Tristan Bouchard
% Date -------- February 22, 2019
%======================================================================
function [ODEPoints] = eulerODE(y, time, derivativeHandle)
    h = time(2) - time(1);    
    points = zeros(size(time), size(y));
    points(1,:) = y';
    
    for i=1:size(time)
        dy = derivativeHandle(time(i),y);
        y = y + dy*h;
        points(i+1,:) = y'; 
    end
    
    ODEPoints = [time' points'];
end

