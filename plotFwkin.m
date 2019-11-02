function plotFwkin(joint_positions)
clf

plot3(0, 0, 0, 'o'); % point 0
hold on;
plot3([0, joint_positions(1,1)], [0, joint_positions(2,1)], [0, joint_positions(3,1)]);
hold on;

plot3(joint_positions(1,1), joint_positions(2,1), joint_positions(3,1), 'o'); % point 1
hold on;
plot3([joint_positions(1,1), joint_positions(1,2)], [joint_positions(2,1), joint_positions(2,2)], [joint_positions(3,1), joint_positions(3,2)]);
hold on;

plot3(joint_positions(1,2), joint_positions(2,2), joint_positions(3,2), 'o'); % point 2
hold on;
plot3([joint_positions(1,2), joint_positions(1,3)], [joint_positions(2,2), joint_positions(2,3)], [joint_positions(3,2), joint_positions(3,3)]);
hold on;

plot3(joint_positions(1,3), joint_positions(2,3), joint_positions(3,3), 'o'); % point 3
hold on;
plot3([joint_positions(1,3), joint_positions(1,4)], [joint_positions(2,3), joint_positions(2,4)], [joint_positions(3,3), joint_positions(3,4)]);
hold on;

plot3(joint_positions(1,4), joint_positions(2,4), joint_positions(3,4), 'o'); % point 5
hold on;
plot3([joint_positions(1,4), joint_positions(1,5)], [joint_positions(2,4), joint_positions(2,5)], [joint_positions(3,4), joint_positions(3,5)]);
hold on;

plot3(joint_positions(1,5), joint_positions(2,5), joint_positions(3,5), 'o'); % point 5
hold on;

xlabel('x, mm')
ylabel('y, mm')
zlabel('z, mm')
axis([-20 20 -20 20 0 50])
axis manual;
grid on;
view(3);
drawnow;
end

