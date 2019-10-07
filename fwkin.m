function joint_positions = fwkin(q1,q2,q3,q4,q5)
% angles in rad
    l1 = 4.125; % in
    l2 = 6.43; % in
    

    T01 = fwkintrans(l1,q1,0,-3.1415/2);
    T02 = T01 * fwkintrans(0,q2-3.1415/2,l2,0);
    T03 = T02 * fwkintrans(0,q3,l2,0);
    T04 = T03 * fwkintrans(0,q4,l1,3.1415/2);
    T05 = T04 * fwkintrans(0,q5,0,0);
    
    joint_positions = [T01(1:3,4),T02(1:3,4),T03(1:3,4),T04(1:3,4),T05(1:3,4)];
end