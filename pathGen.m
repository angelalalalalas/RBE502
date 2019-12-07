function path = pathGen(p1,p2,v1,v2,t1,t2)
    % returns a 3 * 4 matrix, when all inputs are 3 * 1
    % path = [xa xb xc xd; ya yb yc yd; za zb zc zd]
    syms xa xb xc xd ya yb yc yd za zb zc zd

    eq1 = xa * t1^3 + xb * t1^2 + xc * t1 + xd == p1(1);
    eq2 = xa * t2^3 + xb * t2^2 + xc * t2 + xd == p2(1);
    eq3 = 3* xa * t1^2 + 2 * xb * t1 + xc == v1(1);
    eq4 = 3* xa * t2^2 + 2 * xb * t2 + xc == v2(1);

    S1 = solve([eq1 eq2 eq3 eq4],[xa xb xc xd]);

    eq5 = ya * t1^3 + yb * t1^2 + yc * t1 + yd == p1(2);
    eq6 = ya * t2^3 + yb * t2^2 + yc * t2 + yd == p2(2);
    eq7 = 3* ya * t1^2 + 2 * yb * t1 + yc == v1(2);
    eq8 = 3* ya * t2^2 + 2 * yb * t2 + yc == v2(2);

    S2 = solve([eq5 eq6 eq7 eq8],[ya yb yc yd]);

    eq9 = za * t1^3 + zb * t1^2 + zc * t1 + zd == p1(3);
    eq10 = za * t2^3 + zb * t2^2 + zc * t2 + zd == p2(3);
    eq11 = 3* za * t1^2 + 2 * zb * t1 + zc == v1(3);
    eq12 = 3* za * t2^2 + 2 * zb * t2 + zc == v2(3);

    S3 = solve([eq9 eq10 eq11 eq12],[za zb zc zd]);

    path = [S1.xa, S1.xb, S1.xc, S1.xd;
        S2.ya, S2.yb, S2.yc, S2.yd;
        S3.za, S3.zb, S3.zc, S3.zd];
end