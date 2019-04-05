%======================================================================
% Function ---- cubicSpline(inputData)
% Description - Computes the cubic spline interpolation of the provided
%               data
% Arguments --- point1: First point of the range, in the format (x,y)
%               point2: Second point of the range, (x,y)
%               point3: End point of the range to be calculated, (x,y)
% Returns ----- Coefficients associated to the polynomials of the points
% Author ------ Tristan Bouchard
% Date -------- March 15, 2019
%======================================================================
function coefficients = cubicSpline(point1, point2, point3)
    % Create initial matrix for coefficients
    coeff= zeros(2,4);

    p1 = point1(2);
    p2 = point2(2);
    p3 = point3(2);
    t1 = point1(1);
    t2 = point2(1);
    t3 = point3(1);

    % Create matrix for system of equations. Here, we want to force that
    % the firstderivative is equal between t1-t2 and t2-t3 Want a natural
    % spline, such that the second order derivative is equal to zero at the
    % endpoints. This method is outlined in the book.
    matrix = [1 t1 t1^2 t1^3 0 0 0 0; ...
        1 t2 t2^2 t2^3 0 0 0 0; ...
        0 0 0 0 1 t2 t2^2 t2^3; ...
        0 0 0 0 1 t3 t3^2 t3^3; ...
        0 1 2*t2 3*t2^2 0 -1 -2*t2 -3*t2^2; ...
        0 0 2 6*t2^2 0 0 -2 -6*t2; ...
        0 0 2 6*t1^2 0 0 0 0; ...
        0 0 0 0 0 0 2 6*t3]; ...
        yMat = [p1 p2 p2 p3 0 0 0 0]';
    coeffMat = matrix\yMat;
    coeff(1,:) = coeffMat(1:4);
    coeff(2,:) = coeffMat(5:8);
    coefficients = coeff;
end

