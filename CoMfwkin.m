function CoMs = CoMfwkin(q1,q2,q3,q4,q5)

% angles in rad
l1 = 4.125 * 25.4; % mm
l2 = 6.43 * 25.4; % mm

link1_CoM = 50.56;
link2_CoM = 83.84;
link3_CoM = 83.84;
link4_CoM = 56.94;

T01 = fwkintrans(l1,q1,0,-pi/2);
T02 = T01 * fwkintrans(0,q2-pi/2,l2,0);
T03 = T02 * fwkintrans(0,q3,l2,0);
T04 = T03 * fwkintrans(0,q4,l1,pi/2);
T05 = T04 * fwkintrans(0,q5,0,0);

T0_L1CoM = fwkintrans(link1_CoM, q1, 0, -pi/2);
T0_L2CoM = T01 * fwkintrans(0, q2-pi/2, link2_CoM, 0);
T0_L3CoM = T02 * fwkintrans(0, q3, link3_CoM, 0);
T0_L4CoM = T03 * fwkintrans(0, q4, link4_CoM, pi/2);

joint_positions = [T01(1:3,4),T02(1:3,4),T03(1:3,4),T04(1:3,4),T05(1:3,4)];

CoMs = [T0_L1CoM(1:3,4), T01(1:3,4), T0_L2CoM(1:3,4), T02(1:3,4), T0_L3CoM(1:3,4), T03(1:3,4), T0_L4CoM(1:3,4), T04(1:3,4), T05(1:3,4)];

% figure;
% 
% plot3(0, 0, 0, 'o'); % point 0
% hold on;
% plot3([0, joint_positions(1,1)], [0, joint_positions(2,1)], [0, joint_positions(3,1)]);
% hold on;
% 
% plot3(joint_positions(1,1), joint_positions(2,1), joint_positions(3,1), 'o'); % point 1
% hold on;
% plot3([joint_positions(1,1), joint_positions(1,2)], [joint_positions(2,1), joint_positions(2,2)], [joint_positions(3,1), joint_positions(3,2)]);
% hold on;
% 
% plot3(joint_positions(1,2), joint_positions(2,2), joint_positions(3,2), 'o'); % point 2
% hold on;
% plot3([joint_positions(1,2), joint_positions(1,3)], [joint_positions(2,2), joint_positions(2,3)], [joint_positions(3,2), joint_positions(3,3)]);
% hold on;
% 
% plot3(joint_positions(1,3), joint_positions(2,3), joint_positions(3,3), 'o'); % point 3
% hold on;
% plot3([joint_positions(1,3), joint_positions(1,4)], [joint_positions(2,3), joint_positions(2,4)], [joint_positions(3,3), joint_positions(3,4)]);
% hold on;
% 
% plot3(joint_positions(1,4), joint_positions(2,4), joint_positions(3,4), 'o'); % point 5
% hold on;
% plot3([joint_positions(1,4), joint_positions(1,5)], [joint_positions(2,4), joint_positions(2,5)], [joint_positions(3,4), joint_positions(3,5)]);
% hold on;
% 
% plot3(joint_positions(1,5), joint_positions(2,5), joint_positions(3,5), 'o'); % point 5
% hold on;
% 
% plot3(T0_L1CoM(1,4), T0_L1CoM(2,4), T0_L1CoM(3,4), 's');
% hold on;
% 
% plot3(T0_L2CoM(1,4), T0_L2CoM(2,4), T0_L2CoM(3,4), 's');
% hold on;
% 
% plot3(T0_L3CoM(1,4), T0_L3CoM(2,4), T0_L3CoM(3,4), 's');
% hold on;
% 
% plot3(T0_L4CoM(1,4), T0_L4CoM(2,4), T0_L4CoM(3,4), 's');
% hold on;
% 
% xlabel('x, mm')
% ylabel('y, mm')
% zlabel('z, mm')
% axis([-600 600 -600 600 0 600])
% axis manual;
% grid on;
% view(3);
% drawnow;

end