%------------------------------------------------------------------------
%  FILENAME:  import_coeff.m
%  DESIGNER:  Szymon Madej
%  PROJECT:   Quadratic Approximation Unit
%  DATE:      2025-03-22
%  PURPOSE:   Parameters for quadra-model.slx and run_main.m.
%------------------------------------------------------------------------
m = 7;
LUT_size = 2^m;
req_accuracy = 5.25e-6;

% f(x) = Af*sin(Bfx+Cf)
Af = 1;
Bf = 2;
Cf = -pi/4; 
%% Datatypes
dt.y_fxd.s = 1;
dt.y_fxd.i = 2;
dt.y_fxd.f = 23;
dt.y_fxd.w = dt.y_fxd.i + dt.y_fxd.f;

dt.r_f = 0; % 4

dt.s_fxd.s = 1;
dt.s_fxd.i = dt.y_fxd.i;
dt.s_fxd.f = dt.y_fxd.f + dt.r_f;
dt.s_fxd.w = dt.s_fxd.i + dt.s_fxd.f;

dt.coeff_fxd.s = 1;
dt.coeff_fxd.i = 2; % 4
dt.coeff_fxd.f = 19; % 28
dt.coeff_fxd.w = dt.coeff_fxd.i + dt.coeff_fxd.f;

dt.x_fxd.s = 0;
dt.x_fxd.i = 1;
dt.x_fxd.f = 23;
dt.x_fxd.w = dt.x_fxd.i + dt.x_fxd.f;

dt.x1_fxd.s = 0;
dt.x1_fxd.i = 1;
dt.x1_fxd.f = 6;
dt.x1_fxd.w = dt.x1_fxd.i + dt.x1_fxd.f;

dt.x2_fxd.s = 0;
dt.x2_fxd.i = 0;
dt.x2_fxd.f = 17;
dt.x2_fxd.w = dt.x2_fxd.i + dt.x2_fxd.f;

dt.sq_fxd.s = 0;
dt.sq_fxd.i = 2*dt.x2_fxd.i;
dt.sq_fxd.f = 19; %24
dt.sq_fxd.w = dt.sq_fxd.i + dt.sq_fxd.f;

dt.t0_fxd.s = 1;
dt.t0_fxd.i = dt.coeff_fxd.i;
dt.t0_fxd.f = dt.s_fxd.f;
dt.t0_fxd.w = dt.t0_fxd.i + dt.t0_fxd.f;

dt.t1_fxd.s = 1;
dt.t1_fxd.i = dt.coeff_fxd.i + dt.x2_fxd.i;
dt.t1_fxd.f = dt.s_fxd.f;
dt.t1_fxd.w = dt.t1_fxd.i + dt.t1_fxd.f;

dt.t2_fxd.s = 1;
dt.t2_fxd.i = dt.coeff_fxd.i + dt.sq_fxd.i;
dt.t2_fxd.f = dt.s_fxd.f;
dt.t2_fxd.w = dt.t2_fxd.i + dt.t2_fxd.f;