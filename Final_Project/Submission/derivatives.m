function [ydot, udot] = derivatives(time, u, y)
udot = -2u - 4y;
ydot = udot;
end

