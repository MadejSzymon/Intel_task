%------------------------------------------------------------------------
%  FILENAME:  run_main.m
%  DESIGNER:  Szymon Madej
%  PROJECT:   Quadratic Approximation Unit
%  DATE:      2025-03-22
%  PURPOSE:   Script for preparing quadra-model simulation of quadra
%             design. Run this and then open and run quadra-model.slx
%------------------------------------------------------------------------
clear
clc
params;
%% Import x_fxd - u1.23 and preprare it for usage in simulation
x_fxd_filename = "../c++-model/output_data/x_fxd.dat";
x_fxd = importdata(x_fxd_filename);
tstep = 1;
t = (0:tstep:size(x_fxd)-1)';
tmax = max(t);
x_fxd_for_sim = [t,x_fxd];
%% Import x_dbl - double and preprare it for usage in simulation
x_dbl_filename = "../c++-model/output_data/x_dbl.dat";
x_dbl = importdata(x_dbl_filename);
x_dbl_for_sim = [t,x_dbl];

%% Import coefficients - double and cast them to dt.coeff_fxd
coeff_filename = '../c++-model/CoeffTable.hpp';
a_dbl = import_coeff(coeff_filename,'%*10s%35f%[^\n\r]',4,131);
b_dbl = import_coeff(coeff_filename,'%*45s%35f%[^\n\r]',4,131);
c_dbl = import_coeff(coeff_filename,'%*80s%34f%[^\n\r]',4,131);
a_fxd = (fi(a_dbl,dt.coeff_fxd.s,dt.coeff_fxd.w,dt.coeff_fxd.f))';
b_fxd = (fi(b_dbl,dt.coeff_fxd.s,dt.coeff_fxd.w,dt.coeff_fxd.f))';
c_fxd = (fi(c_dbl,dt.coeff_fxd.s,dt.coeff_fxd.w,dt.coeff_fxd.f))';

%% Prepare LUT breakpoints
LUT_breakpoints = 0:LUT_size-1;
LUT_breakpoints_hdl = fi(LUT_breakpoints,0,7,0);

