%% Inverse Kinematics for 3dof
% Units: meters, radians
function [q1, q2, q3] = ikin_meter(y, z, theta)

% Robot Parameters
L1 = 4.125 * 0.0254; % L1 in meter
L2 = 6.43 * 0.0254; % L2 in meter

P_prime = [x - cos(atan2(y,x)) * L1 * cos(theta - pi/2); % adjusted goal point
           y - sin(atan2(y,x)) * L1 * cos(theta - pi/2);
           z - L1 * cos(theta)];
a = norm(P_prime - [0; 0; L1]); % length of vector between top of link 1 and adjusted goal point

A = acos((a^2 - 2*(L2^2))/(-2*(L2^2)));
B = acos(a/(2*L2));
C = pi - A - B;
alpha = asin((P_prime(3) - L1)/a);

q1 = (pi/2) - C - alpha;
q2 = pi - A;
q3 = theta - q2 - q3;

disp([q1 q2 q3])

% fwkin(q1, q2, q3, q4, q5);
% 
% plot3(x, y, z, 'd', 'MarkerSize', 12, 'Color', 'r');