%======================================================================
% Function ---- newtonCoefficients(x, dataPoints)
% Description - Computes the coefficients of the newton polynomial
%               interpolant.
% Arguments --- dataPoints: dataPoints of the
%               function, with the time values as a 2D vertical matrix of
%               the form: 
%               [time_1 data_1;
%                time_2 data_2;
%                    ...
%               time_n data_n]
% Returns ----- Coefficients of the newton interpolant function
% Author ------ Tristan Bouchard
% Date -------- March 16, 2019
%======================================================================
function interpolationCoefficients = newtonCoefficients(dataPoints)
    time = dataPoints(:,1);
    data = dataPoints(:,2);

    % Make square matrix in which to place newton polynomials
    A = zeros(length(time), length(time));
    % Fill in square matrix with newton weight function polynomials
    for i = 1:length(time)
        for j = 1:length(time)
            A(i, j) = newtonWeight(time(i),j,time);
        end
    end
    
    % Compute result of A*x = y to find x's to our polynomial.
    x = A\data;
    interpolationCoefficients = x;
  end

