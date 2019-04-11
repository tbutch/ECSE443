%======================================================================
% Function ---- eulerODE(y0, u0, time,ufunc, yfunc)
% Description - Calculate the datapoints of an ODE using the Euler method
% Arguments --- y0: Value of the function at t = 0
%               u0: Value of the derivative of the function at t0
%               time: The time values for which to compute the data points
%               ufunc: Function representing first order derivative, u
%               yfunc: Function representing second order derivative, u'
% Returns ----- ODEPoints: data points to ODE
% Author ------ Tristan Bouchard
% Date -------- April 9, 2019
%======================================================================
function [ODEPoints] = eulerODE(y0, u0, time,ufunc, yfunc)
    h = time(2) - time(1);   
    sz = size(time);
    points = zeros(sz(2), 2);
    
    % Set initial conditions
    points(1,1) = y0;
    points(1,2) = u0;
    
    for i=1:(sz(2)-1)
        y = points(i,1);
        u = points(i,2);
        t = time(i);
        points(i+1,1) = points(i, 1) + h*ufunc(t, u, y);
        points(i+1,2) = points(i, 2) + h*yfunc(t, u, y);
    end
    
    ODEPoints = [time' points];
end

