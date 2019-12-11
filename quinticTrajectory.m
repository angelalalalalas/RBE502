function coeffMat = quinticTrajectory(ti, tf, pi, pf, vi, vf, ai, af)
        % The matrix containing the terms of the constraint equations
        quinticMat = [ 1, ti, ti^2,     ti^3,      ti^4,      ti^5;
                       0,  1, 2*ti, 3*(ti^2),  4*(ti^3),  5*(ti^4);
                       0,  0,    2,     6*ti, 12*(ti^2), 20*(ti^3);
                       1, tf, tf^2,     tf^3,      tf^4,      tf^5;
                       0,  1, 2*tf, 3*(tf^2),  4*(tf^3),  5*(tf^4);
                       0,  0,    2,     6*tf, 12*(tf^2), 20*(tf^3)];
        % This matrix contains the initial and end conditions
        initEndMat = [pi; vi; ai; pf; vf; af];

        coeffMat = quinticMat\initEndMat; %inverse quinticMat * initEndMat
end