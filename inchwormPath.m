function [] = inchwormPath()
    %% walking path small step
    pi_walk = [0, 0.1524, 0];
    pf_walk = [0, 0.2286, 0];
    vi_walk = [0, 0, 0.03];
    vf_walk = [0, 0, -0.03];
    ti_walk = 0;
    tf_walk = 10;
    t_walk = ti_walk: 0.01: tf_walk;
    
    path_walk = pathGen(pi_walk, pf_walk, vi_walk, vf_walk, ti_walk, tf_walk)
    x_path = path_walk(1,1) * t_walk .^3 + path_walk(1,2) * t_walk .^2 + path_walk(1,3) * t_walk + path_walk(1,4);
    y_path = path_walk(2,1) * t_walk .^3 + path_walk(2,2) * t_walk .^2 + path_walk(2,3) * t_walk + path_walk(2,4);
    z_path = path_walk(3,1) * t_walk .^3 + path_walk(3,2) * t_walk .^2 + path_walk(3,3) * t_walk + path_walk(3,4);
    
    base = [0, 0, 0];
    qi_walk = ikin(0, 0.1524, 0, pi, 0); % 5 x 1
    pi_walk_plot = fwkin(qi_walk(1), qi_walk(2), qi_walk(3), qi_walk(4), qi_walk(5)); % 3 x 5
    qf_walk = ikin(0, 0.2286, 0, pi, 0); % 5 x 1
    pf_walk_plot = fwkin(qf_walk(1), qf_walk(2), qf_walk(3), qf_walk(4), qf_walk(5)); % 3 x 5
    
    figure('Name','Walking Path with One-Block Step');
    scatter3(base(1), base(2), base(3),'g');
    hold on
    plot3([base(1), pi_walk_plot(1,1)], [base(2), pi_walk_plot(2,1)], [base(3), pi_walk_plot(3,1)],'g');
    
    scatter3(pi_walk_plot(1,1), pi_walk_plot(2,1), pi_walk_plot(3,1),'g'); 
    plot3([pi_walk_plot(1,1), pi_walk_plot(1,2)], [pi_walk_plot(2,1), pi_walk_plot(2,2)], [pi_walk_plot(3,1), pi_walk_plot(3,2)],'g');
    scatter3(pi_walk_plot(1,2), pi_walk_plot(2,2), pi_walk_plot(3,2),'g');
    plot3([pi_walk_plot(1,2), pi_walk_plot(1,3)], [pi_walk_plot(2,2), pi_walk_plot(2,3)], [pi_walk_plot(3,2), pi_walk_plot(3,3)],'g');
    scatter3(pi_walk_plot(1,3), pi_walk_plot(2,3), pi_walk_plot(3,3),'g');
    plot3([pi_walk_plot(1,3), pi_walk_plot(1,4)], [pi_walk_plot(2,3), pi_walk_plot(2,4)], [pi_walk_plot(3,3), pi_walk_plot(3,4)],'g');
    scatter3(pi_walk_plot(1,4), pi_walk_plot(2,4), pi_walk_plot(3,4),'g');
    
    plot3(x_path,y_path,z_path,'b');
    
    scatter3(pf_walk_plot(1,1), pf_walk_plot(2,1), pf_walk_plot(3,1),'r'); 
    plot3([pf_walk_plot(1,1), pf_walk_plot(1,2)], [pf_walk_plot(2,1), pf_walk_plot(2,2)], [pf_walk_plot(3,1), pf_walk_plot(3,2)],'r');
    scatter3(pf_walk_plot(1,2), pf_walk_plot(2,2), pf_walk_plot(3,2),'r');
    plot3([pf_walk_plot(1,2), pf_walk_plot(1,3)], [pf_walk_plot(2,2), pf_walk_plot(2,3)], [pf_walk_plot(3,2), pf_walk_plot(3,3)],'r');
    scatter3(pf_walk_plot(1,3), pf_walk_plot(2,3), pf_walk_plot(3,3),'r');
    plot3([pf_walk_plot(1,3), pf_walk_plot(1,4)], [pf_walk_plot(2,3), pf_walk_plot(2,4)], [pf_walk_plot(3,3), pf_walk_plot(3,4)],'r');
    scatter3(pf_walk_plot(1,4), pf_walk_plot(2,4), pf_walk_plot(3,4),'r');
    
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    xlim([-0.1 0.4]);
    ylim([-0.1 0.4]);
    zlim([-0.1 0.4]);
    grid on
    title('Inchworm Robot Walking Path with One-Block Step');
    
    %% walking path large step
    pi_walk = [0, 0.1524, 0];
    pf_walk = [0, 0.3048, 0];
    vi_walk = [0, 0, 0.03];
    vf_walk = [0, 0, -0.03];
    ti_walk = 0;
    tf_walk = 10;
    t_walk = ti_walk: 0.01: tf_walk;
    
    path_walk = pathGen(pi_walk, pf_walk, vi_walk, vf_walk, ti_walk, tf_walk)
    x_path = path_walk(1,1) * t_walk .^3 + path_walk(1,2) * t_walk .^2 + path_walk(1,3) * t_walk + path_walk(1,4);
    y_path = path_walk(2,1) * t_walk .^3 + path_walk(2,2) * t_walk .^2 + path_walk(2,3) * t_walk + path_walk(2,4);
    z_path = path_walk(3,1) * t_walk .^3 + path_walk(3,2) * t_walk .^2 + path_walk(3,3) * t_walk + path_walk(3,4);
    
    qi_walk = ikin(0, 0.1524, 0, pi, 0); % 5 x 1
    pi_walk_plot = fwkin(qi_walk(1), qi_walk(2), qi_walk(3), qi_walk(4), qi_walk(5)); % 3 x 5
    qf_walk = ikin(0, 0.3048, 0, pi, 0); % 5 x 1
    pf_walk_plot = fwkin(qf_walk(1), qf_walk(2), qf_walk(3), qf_walk(4), qf_walk(5)); % 3 x 5
    
    figure('Name','Walking Path with Two-Block Step');
    scatter3(base(1), base(2), base(3),'g');
    hold on
    plot3([base(1), pi_walk_plot(1,1)], [base(2), pi_walk_plot(2,1)], [base(3), pi_walk_plot(3,1)],'g');
    
    scatter3(pi_walk_plot(1,1), pi_walk_plot(2,1), pi_walk_plot(3,1),'g'); 
    plot3([pi_walk_plot(1,1), pi_walk_plot(1,2)], [pi_walk_plot(2,1), pi_walk_plot(2,2)], [pi_walk_plot(3,1), pi_walk_plot(3,2)],'g');
    scatter3(pi_walk_plot(1,2), pi_walk_plot(2,2), pi_walk_plot(3,2),'g');
    plot3([pi_walk_plot(1,2), pi_walk_plot(1,3)], [pi_walk_plot(2,2), pi_walk_plot(2,3)], [pi_walk_plot(3,2), pi_walk_plot(3,3)],'g');
    scatter3(pi_walk_plot(1,3), pi_walk_plot(2,3), pi_walk_plot(3,3),'g');
    plot3([pi_walk_plot(1,3), pi_walk_plot(1,4)], [pi_walk_plot(2,3), pi_walk_plot(2,4)], [pi_walk_plot(3,3), pi_walk_plot(3,4)],'g');
    scatter3(pi_walk_plot(1,4), pi_walk_plot(2,4), pi_walk_plot(3,4),'g');
    
    plot3(x_path,y_path,z_path,'b');
    
    scatter3(pf_walk_plot(1,1), pf_walk_plot(2,1), pf_walk_plot(3,1),'r'); 
    plot3([pf_walk_plot(1,1), pf_walk_plot(1,2)], [pf_walk_plot(2,1), pf_walk_plot(2,2)], [pf_walk_plot(3,1), pf_walk_plot(3,2)],'r');
    scatter3(pf_walk_plot(1,2), pf_walk_plot(2,2), pf_walk_plot(3,2),'r');
    plot3([pf_walk_plot(1,2), pf_walk_plot(1,3)], [pf_walk_plot(2,2), pf_walk_plot(2,3)], [pf_walk_plot(3,2), pf_walk_plot(3,3)],'r');
    scatter3(pf_walk_plot(1,3), pf_walk_plot(2,3), pf_walk_plot(3,3),'r');
    plot3([pf_walk_plot(1,3), pf_walk_plot(1,4)], [pf_walk_plot(2,3), pf_walk_plot(2,4)], [pf_walk_plot(3,3), pf_walk_plot(3,4)],'r');
    scatter3(pf_walk_plot(1,4), pf_walk_plot(2,4), pf_walk_plot(3,4),'r');
    
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    xlim([-0.1 0.4]);
    ylim([-0.1 0.4]);
    zlim([-0.1 0.4]);
    grid on
    title('Inchworm Robot Walking Path with Two-Block Step');
    
    %% Climbing path
    pi_climb = [0, 0.1524, 0];
    pf_climb = [0, 0.2286, 0.0762];
    vi_climb = [0, 0, 0.03];
    vf_climb = [0, 0, -0.03];
    ti_climb = 0;
    tf_climb = 10;
    t_climb = ti_climb: 0.01: tf_climb;
    
    path_climb = pathGen(pi_climb, pf_climb, vi_climb, vf_climb, ti_climb, tf_climb)
    x_path = path_climb(1,1) * t_climb .^3 + path_climb(1,2) * t_climb .^2 + path_climb(1,3) * t_climb + path_climb(1,4);
    y_path = path_climb(2,1) * t_climb .^3 + path_climb(2,2) * t_climb .^2 + path_climb(2,3) * t_climb + path_climb(2,4);
    z_path = path_climb(3,1) * t_climb .^3 + path_climb(3,2) * t_climb .^2 + path_climb(3,3) * t_climb + path_climb(3,4);
    
    qi_climb = ikin(0, 0.1524, 0, pi, 0); % 5 x 1
    pi_climb_plot = fwkin(qi_climb(1), qi_climb(2), qi_climb(3), qi_climb(4), qi_climb(5)); % 3 x 5
    qf_climb = ikin(0, 0.2286, 0.0762, pi, 0); % 5 x 1
    pf_climb_plot = fwkin(qf_climb(1), qf_climb(2), qf_climb(3), qf_climb(4), qf_climb(5)); % 3 x 5
    
    figure('Name','Climbing Path');
    scatter3(base(1), base(2), base(3),'g');
    hold on
    plot3([base(1), pi_climb_plot(1,1)], [base(2), pi_climb_plot(2,1)], [base(3), pi_climb_plot(3,1)],'g');
    
    scatter3(pi_climb_plot(1,1), pi_climb_plot(2,1), pi_climb_plot(3,1),'g'); 
    plot3([pi_climb_plot(1,1), pi_climb_plot(1,2)], [pi_climb_plot(2,1), pi_climb_plot(2,2)], [pi_climb_plot(3,1), pi_climb_plot(3,2)],'g');
    scatter3(pi_climb_plot(1,2), pi_climb_plot(2,2), pi_climb_plot(3,2),'g');
    plot3([pi_climb_plot(1,2), pi_climb_plot(1,3)], [pi_climb_plot(2,2), pi_climb_plot(2,3)], [pi_climb_plot(3,2), pi_climb_plot(3,3)],'g');
    scatter3(pi_climb_plot(1,3), pi_climb_plot(2,3), pi_climb_plot(3,3),'g');
    plot3([pi_climb_plot(1,3), pi_climb_plot(1,4)], [pi_climb_plot(2,3), pi_climb_plot(2,4)], [pi_climb_plot(3,3), pi_climb_plot(3,4)],'g');
    scatter3(pi_climb_plot(1,4), pi_climb_plot(2,4), pi_climb_plot(3,4),'g');
    
    plot3(x_path,y_path,z_path,'b');
    
    scatter3(pf_climb_plot(1,1), pf_climb_plot(2,1), pf_climb_plot(3,1),'r'); 
    plot3([pf_climb_plot(1,1), pf_climb_plot(1,2)], [pf_climb_plot(2,1), pf_climb_plot(2,2)], [pf_climb_plot(3,1), pf_climb_plot(3,2)],'r');
    scatter3(pf_climb_plot(1,2), pf_climb_plot(2,2), pf_climb_plot(3,2),'r');
    plot3([pf_climb_plot(1,2), pf_climb_plot(1,3)], [pf_climb_plot(2,2), pf_climb_plot(2,3)], [pf_climb_plot(3,2), pf_climb_plot(3,3)],'r');
    scatter3(pf_climb_plot(1,3), pf_climb_plot(2,3), pf_climb_plot(3,3),'r');
    plot3([pf_climb_plot(1,3), pf_climb_plot(1,4)], [pf_climb_plot(2,3), pf_climb_plot(2,4)], [pf_climb_plot(3,3), pf_climb_plot(3,4)],'r');
    scatter3(pf_climb_plot(1,4), pf_climb_plot(2,4), pf_climb_plot(3,4),'r');
    
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    xlim([-0.1 0.4]);
    ylim([-0.1 0.4]);
    zlim([-0.1 0.4]);
    grid on
    title('Inchworm Robot Stair Climbing Path');
end