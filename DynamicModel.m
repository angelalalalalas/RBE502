% masses, Kg
L1CoM_m = 0.08;
L2CoM_m = 0.09;
L3CoM_m = 0.08;
L4CoM_m = 0.09;

J1_m = 0.07;
J2_m = 0.07;
J3_m = 0.07;
J4_m = 0.07;
J5_m = 0.07;

g = 9.81;

syms q1(t) q2(t) q3(t) q4(t) q5(t) q1_dot(t) q2_dot(t) q3_dot(t) q4_dot(t) q5_dot(t)
syms q1t q2t q3t q4t q5t q1t_dot q2t_dot q3t_dot q4t_dot q5t_dot q1t_dd q2t_dd q3t_dd q4t_dd q5t_dd

% Position Kinematics
CoMs = CoMfwkin(q1t, q2t, q3t, q4t, q5t);

L1CoM_p = CoMs(1:3,1);
J1_p = CoMs(1:3,2);
L2CoM_p = CoMs(1:3,3);
J2_p = CoMs(1:3,4);
L3CoM_p = CoMs(1:3,5);
J3_p = CoMs(1:3,6);
L4CoM_p = CoMs(1:3,7);
J4_p = CoMs(1:3,8);
J5_p = CoMs(1:3,9);

% Velocity Kinematics

L1CoM_v = jacobian(L1CoM_p, [q1t]) * q1t_dot;
J1_v = jacobian(J1_p, [q1t]) * q1t_dot;
L2CoM_v = jacobian(L2CoM_p, [q1t, q2t]) * [q1t_dot; q2t_dot];
J2_v = jacobian(J2_p, [q1t, q2t]) * [q1t_dot; q2t_dot];
L3CoM_v = jacobian(L3CoM_p, [q1t, q2t, q3t]) * [q1t_dot; q2t_dot; q3t_dot];
J3_v = jacobian(J3_p, [q1t, q2t, q3t]) * [q1t_dot; q2t_dot; q3t_dot];
L4CoM_v = jacobian(L4CoM_p, [q1t, q2t, q3t, q4t]) * [q1t_dot; q2t_dot; q3t_dot; q4t_dot];
J4_v = jacobian(J4_p, [q1t, q2t, q3t, q4t]) * [q1t_dot; q2t_dot; q3t_dot; q4t_dot];
J5_v = jacobian(J5_p, [q1t, q2t, q3t, q4t, q5t]) * [q1t_dot; q2t_dot; q3t_dot; q4t_dot; q5t_dot];

L1CoM_v_sqr = L1CoM_v.' * L1CoM_v;
J1_v_sqr = J1_v.' * J1_v;
L2CoM_v_sqr = L2CoM_v.' * L2CoM_v;
J2_v_sqr = J2_v.' * J2_v;
L3CoM_v_sqr = L3CoM_v.' * L3CoM_v;
J3_v_sqr = J3_v.' * J3_v;
L4CoM_v_sqr = L4CoM_v.' * L4CoM_v;
J4_v_sqr = J4_v.' * J4_v;
J5_v_sqr = J5_v.' * J5_v;

% Lagrangian

K1 = 0.5 * L1CoM_m * L1CoM_v_sqr;
P1 = L1CoM_m * g * L1CoM_p(3);

K2 = 0.5 * J1_m * J1_v_sqr;
P2 = J1_m * g * J1_p(3);

K3 = 0.5 * L2CoM_m * L2CoM_v_sqr;
P3 = L2CoM_m * g * L2CoM_p(3);

K4 = 0.5 * J2_m * J2_v_sqr;
P4 = J2_m * g * J2_p(3);

K5 = 0.5 * L3CoM_m * L3CoM_v_sqr;
P5 = L3CoM_m * g * L3CoM_p(3);

K6 = 0.5 * J3_m * J3_v_sqr;
P6 = J3_m * g * J3_p(3);

K7 = 0.5 * L4CoM_m * L4CoM_v_sqr;
P7 = L4CoM_m * g * L4CoM_p(3);

K8 = 0.5 * J4_m * J4_v_sqr;
P8 = J4_m * g * J4_p(3);

K9 = 0.5 * J5_m * J5_v_sqr;
P9 = J5_m * g * J5_p(3);

L = (K1 + K2 + K3 + K4 + K5 + K6 + K7 + K8 + K9) - (P1 + P2 + P3 + P4 + P5 + P6 + P7 + P8 + P9);

% Lagrange's Equation

pL_wrt_q1 = diff(L, q1t);
pL_wrt_q2 = diff(L, q2t);
pL_wrt_q3 = diff(L, q3t);
pL_wrt_q4 = diff(L, q4t);
pL_wrt_q5 = diff(L, q5t);

pL_wrt_q1_dot = diff(L, q1t_dot);
pL_wrt_q2_dot = diff(L, q2t_dot);
pL_wrt_q3_dot = diff(L, q3t_dot);
pL_wrt_q4_dot = diff(L, q4t_dot);
pL_wrt_q5_dot = diff(L, q5t_dot);

pL_wrt_q1_dot_t = subs(pL_wrt_q1_dot, [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot], [q1(t), q2(t), q3(t), q4(t), q5(t) q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t)]);
pL_wrt_q2_dot_t = subs(pL_wrt_q2_dot, [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot], [q1(t), q2(t), q3(t), q4(t), q5(t) q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t)]);
pL_wrt_q3_dot_t = subs(pL_wrt_q3_dot, [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot], [q1(t), q2(t), q3(t), q4(t), q5(t) q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t)]);
pL_wrt_q4_dot_t = subs(pL_wrt_q4_dot, [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot], [q1(t), q2(t), q3(t), q4(t), q5(t) q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t)]);
pL_wrt_q5_dot_t = subs(pL_wrt_q5_dot, [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot], [q1(t), q2(t), q3(t), q4(t), q5(t) q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t)]);

d_pL_wrt_q1_dot_dt = diff(pL_wrt_q1_dot_t, t);
d_pL_wrt_q2_dot_dt = diff(pL_wrt_q2_dot_t, t);
d_pL_wrt_q3_dot_dt = diff(pL_wrt_q3_dot_t, t);
d_pL_wrt_q4_dot_dt = diff(pL_wrt_q4_dot_t, t);
d_pL_wrt_q5_dot_dt = diff(pL_wrt_q5_dot_t, t);


tau = [d_pL_wrt_q1_dot_dt - pL_wrt_q1;
       d_pL_wrt_q2_dot_dt - pL_wrt_q2;
       d_pL_wrt_q3_dot_dt - pL_wrt_q3;
       d_pL_wrt_q4_dot_dt - pL_wrt_q4;
       d_pL_wrt_q5_dot_dt - pL_wrt_q5];

tau = simplify(subs(tau, [q1(t), q2(t), q3(t), q4(t), q5(t), q1_dot(t), q2_dot(t), q3_dot(t), q4_dot(t), q5_dot(t), diff(q1(t), t), diff(q2(t), t), diff(q3(t), t), diff(q4(t), t), diff(q5(t), t), diff(q1_dot(t), t), diff(q2_dot(t), t), diff(q3_dot(t), t), diff(q4_dot(t), t), diff(q5_dot(t), t)], [q1t, q2t, q3t, q4t, q5t, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot, q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot, q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd]));

G = simplify(subs(tau, [q1t_dot, q2t_dot, q3t_dot, q4t_dot, q5t_dot, q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]))

tau_minus_G = simplify(tau - G);

C_qdot = simplify(subs(tau_minus_G, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0,0,0,0,0]))

M_qdd = tau - G - C_qdot;
M1 = subs(M_qdd, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [1, 0, 0, 0, 0]);
M2 = subs(M_qdd, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0, 1, 0, 0, 0]);
M3 = subs(M_qdd, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0, 0, 1, 0, 0]);
M4 = subs(M_qdd, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0, 0, 0, 1, 0]);
M5 = subs(M_qdd, [q1t_dd, q2t_dd, q3t_dd, q4t_dd, q5t_dd], [0, 0, 0, 0, 1]);

M_mat = simplify([M1, M2, M3, M4, M5])