%======================================================================
% Function ---- rungeKutta2Heun(y0, u0, time,ufunc, yfunc)
% Description - Calculate the datapoints of an ODE using the Runge-Kutta
%               2nd order Hein method
% Arguments --- y0: Value of the function at t = 0
%               u0: Value of the derivative of the function at t0
%               time: The time values for which to compute the data points
%               ufunc: Function representing first order derivative, u
% Returns ----- ODEPoints: data points to ODE
% Author ------ Tristan Bouchard
% Date -------- April 9, 2019
%======================================================================
function ODEPoints = rungeKutta2Heun(y0, time, ufunc)
    h = time(2) - time(1);   
    sz = size(time);
    points = zeros(sz(2), 1);
    
    % Set initial conditions
    points(1,1) = y0;
    
    for i=1:(sz(2)-1)
        y = points(i,1);
        t = time(i);
        
        % K's for y
        k1 = ufunc(t, y);
        k2 = ufunc(t + h, y + (h*k1));
      
        points(i+1,1) = points(i, 1) + (h/2)*(k1 + k2);
    end
    
    ODEPoints = [time' points];
end

