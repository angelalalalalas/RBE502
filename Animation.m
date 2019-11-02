for t=0:.05:3.1
    th = t;
    x = 5 * cos(th);
    y = 5 * sin(th);
    z = 2 * t + 5;
    theta = pi;
    [q1, q2, q3, q4, q5] = ikin(x, y, z, theta, 0);
    
    plotFwkin(fwkin(q1, q2, q3, q4, q5));
end