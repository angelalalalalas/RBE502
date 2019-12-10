function joint_positions = fwkin(q1,q2,q3,q4,q5)
% angles in rad
l1 = 4.125* 0.0254; % in
l2 = 6.43* 0.0254; % in


T01 = fwkintrans(l1,q1,0,-pi/2);
T02 = T01 * fwkintrans(0,q2-pi/2,l2,0);
T03 = T02 * fwkintrans(0,q3,l2,0);
T04 = T03 * fwkintrans(0,q4,l1,pi/2);
T05 = T04 * fwkintrans(0,q5,0,0);

joint_positions = [T01(1:3,4),T02(1:3,4),T03(1:3,4),T04(1:3,4),T05(1:3,4)];
% 
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
% 
% 
% xlabel('x, mm')
% ylabel('y, mm')
% zlabel('z, mm')
% axis([-20 20 -20 20 0 50])
% axis manual;
% grid on;
% view(3);
% drawnow;

end