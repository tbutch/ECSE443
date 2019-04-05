%======================================================================
% Function ---- plotData(inputData1, inputData2, inputData3, titles, plotTitle, yScale)
% Description - Plots up to three 2D arrays using scatter.
% Arguments --- inputData1: First data points to graph, will be plotted in
%               red
%               inputData2: Second data points to graph, will be plotted in
%               green
%               inputData2: Third data points to graph, will be plotted in
%               blue
%               titles: Used for the legend
%               plotTitle: Used for the title to the plot
%               yScale: Used to limit the scale of the y function
% Returns ----- scatter object, to display
% Author ------ Tristan Bouchard
% Date -------- February 21, 2019
%======================================================================
function [s] = plotData(inputData1, inputData2, inputData3, titles, plotTitle, yScale)
% Parse inputs
status = 0;
if(~ismatrix(inputData1))
    s = "Please input valid data";
    return
elseif(ismatrix(inputData1) && isstring(inputData2))
    status = 1;
elseif(ismatrix(inputData1) && ismatrix(inputData2) && isstring(inputData3))
    status = 2;
elseif(ismatrix(inputData1) && ismatrix(inputData2) && isstring(inputData3))
    status = 3;
end

% Set variables for graphs
size = 10;
color1 = [1 0 0];
color2 = [0 1 0];
color3 = [0 0 1];

switch status
    case 1
        s = scatter(inputData1(:,1),inputData1(:,2), size, color1, "filled");
        title(plotTitle);
        xlabel("time");
        ylabel("y")
        legend(titles);
        return
    case 2
        scatter(inputData1(:,1),inputData1(:,2), size, color1, "filled");
        hold on;
        s = scatter(inputData2(:,1),inputData2(:,2), size, color2, "filled");
        title(plotTitle);
        xlabel("time");
        ylabel("y")
        legend(titles);
        ylim(yScale);
        hold off;
        return
    case 3
        scatter(inputData1(:,1),inputData1(:,2), size, color1, "filled");
        hold on;
        scatter(inputData2(:,1),inputData2(:,2), size, color2, "filled");
        hold on;
        s = scatter(inputData3(:,1),inputData3(:,2), size, color3, "filled");
        title(plotTitle);
        xlabel("time");
        ylabel("y")
        legend(titles);
        hold off;
        return
end
end

