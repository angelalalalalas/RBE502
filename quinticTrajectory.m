function coeffMat = quinticTrajectory(ti, tf, pi, pf, vi, vf, ai, af)
        % The matrix containing the terms of the constraint equations
        quinticMat = [     ti^5,      ti^4,     ti^3, ti^2, ti, 1;
                       5*(ti^4),  4*(ti^3), 3*(ti^2), 2*ti,  1, 0;
                      20*(ti^3), 12*(ti^2),     6*ti,    2,  0, 0;
                           tf^5,      tf^4,     tf^3, tf^2, tf, 1;
                       5*(tf^4),  4*(tf^3), 3*(tf^2), 2*tf,  1, 0;
                      20*(tf^3), 12*(tf^2),     6*tf,    2,  0, 0];
        % This matrix contains the initial and end conditions
        initEndMat = [pi; vi; ai; pf; vf; af];

        coeffMat = quinticMat\initEndMat; %inverse quinticMat * initEndMat
end