%% Inverse Kinematics
% Units: inches, radians
function [q1, q2, q3, q4, q5] = ikin(x, y, z, theta, phi)

% Robot Parameters
L1 = 4.125; % L1 in inches
L2 = 6.43; % L2 in inches

z_goal = [sin(theta); 0; cos(theta)];

P_prime = [x - L1 * z_goal(1); % adjusted goal point
           y;
           z - L1 * z_goal(3)];
a = norm(P_prime - [0; 0; L1]); % length of vector between top of link 1 and adjusted goal point

A = acos((a^2 - 2*(L2^2))/(-2*(L2^2)));
B = acos(a/(2*L2));
C = pi - A - B;
alpha = asin((P_prime(3) - L1)/a);

q1 = atan2(y,x);
q2 = (pi/2) - C - alpha;
q3 = pi - A;
q4 = theta - q2 - q3;
q5 = phi;

disp([q1 q2 q3 q4 q5])