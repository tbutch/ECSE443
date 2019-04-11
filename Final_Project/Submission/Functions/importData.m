
%======================================================================
% Function ---- importData(dataPath)
% Description - Imports the data from a text file. The file needs to be
%               in the same folder as the script.
% Arguments --- fileName: name to the file to import data from
% Returns ----- data: Returns the data in matrix form
% Author ------ Tristan Bouchard
% Date -------- February 21, 2019
%======================================================================
function [data] = importData(fileName)
data = table2array(readtable(fileName));
end

