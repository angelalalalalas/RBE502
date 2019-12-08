function [] = inchwormPath()
    %% walking path
    pi_walk = [0, 0.14, 0];
    pf_walk = [0, 0.21, 0];
    vi_walk = [0, 0, 0.03];
    vf_walk = [0, 0, -0.03];
    ti_walk = 0;
    tf_walk = 8;
    t_walk = ti_walk: 0.01: tf_walk;
    
    path_walk = pathGen(pi_walk, pf_walk, vi_walk, vf_walk, ti_walk, tf_walk)
    x_path = path_walk(1,1) * t_walk .^3 + path_walk(1,2) * t_walk .^2 + path_walk(1,3) * t_walk + path_walk(1,4);
    y_path = path_walk(2,1) * t_walk .^3 + path_walk(2,2) * t_walk .^2 + path_walk(2,3) * t_walk + path_walk(2,4);
    z_path = path_walk(3,1) * t_walk .^3 + path_walk(3,2) * t_walk .^2 + path_walk(3,3) * t_walk + path_walk(3,4);
    
    figure('Name','Walking Path');
    plot3(x_path,y_path,z_path);
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    grid on
    title('Inchworm Robot Walking Path');
    
    %% Climbing path
    pi_climb = [0, 0.14, 0];
    pf_climb = [0, 0.21, 0.14];
    vi_climb = [0, 0, 0.03];
    vf_climb = [0, 0.03, 0];
    ti_climb = 0;
    tf_climb = 8;
    t_climb = ti_climb: 0.01: tf_climb;
    
    path_climb = pathGen(pi_climb, pf_climb, vi_climb, vf_climb, ti_climb, tf_climb)
    x_path = path_climb(1,1) * t_climb .^3 + path_climb(1,2) * t_climb .^2 + path_climb(1,3) * t_climb + path_climb(1,4);
    y_path = path_climb(2,1) * t_climb .^3 + path_climb(2,2) * t_climb .^2 + path_climb(2,3) * t_climb + path_climb(2,4);
    z_path = path_climb(3,1) * t_climb .^3 + path_climb(3,2) * t_climb .^2 + path_climb(3,3) * t_climb + path_climb(3,4);
    
    figure('Name','Climbing Path');
    plot3(x_path,y_path,z_path);
    xlabel('x (m)');
    ylabel('y (m)');
    zlabel('z (m)');
    grid on
    title('Inchworm Robot Climbing Path');
end