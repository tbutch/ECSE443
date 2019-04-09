%======================================================================
% Function ---- rungeKutta4(y0, u0, time,ufunc, yfunc)
% Description - Calculate the datapoints of an ODE using the Runge-Kutta
%               4th order method
% Arguments --- y0: Value of the function at t = 0
%               u0: Value of the derivative of the function at t0
%               time: The time values for which to compute the data points
%               ufunc: Function representing first order derivative, u
%               yfunc: Function representing second order derivative, u'
% Returns ----- ODEPoints: data points to ODE
% Author ------ Tristan Bouchard
% Date -------- April 9, 2019
%======================================================================
function ODEPoints = rungeKutta4(y0, u0, time,ufunc, yfunc)
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
        
        % K's for y
        k1 = ufunc(t,u,y);
        k2 = ufunc(t + h/2, u + ((h*k1)/2), y + ((h*k1)/2));
        k3 = ufunc(t + h/2, u + ((h*k2)/2), y + ((h*k2)/2));
        k4 = ufunc(t + h, u + (k3 * h), y + (k3 * h));
        
        %K's for u
        l1 = yfunc(t,u,y);
        l2 = yfunc(t + h/2, u + ((h*l1)/2), y + ((h*l1)/2));
        l3 = yfunc(t + h/2, u + ((h*l2)/2), y + ((h*l2)/2));
        l4 = yfunc(t + h, u + (l3 * h), y + (l3 * h));
        
        points(i+1,1) = points(i, 1) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
        points(i+1,2) = points(i, 2) + (h/6)*(l1 + 2*l2 + 2*l3 + l4);
    end
    
    ODEPoints = [time' points];
end

