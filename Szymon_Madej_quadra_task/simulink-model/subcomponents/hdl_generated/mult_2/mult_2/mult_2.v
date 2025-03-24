// -------------------------------------------------------------
// 
// File Name: /userworkqum/szymadej/Intel_task/simulink_test/hdl_generated/mult_2/mult_2/mult_2.v
// Created: 2025-03-20 20:11:53
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.2
// Target subsystem base rate: 0.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: mult_2
// Source Path: mult_2
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module mult_2
          (sq_fxd,
           c,
           t2_fxd);


  input   [25:0] sq_fxd;  // ufix26_En24
  input   signed [31:0] c;  // sfix32_En28
  output  signed [32:0] t2_fxd;  // sfix33_En27


  wire signed [26:0] mult_2_cast;  // sfix27_En24
  wire signed [58:0] mult_2_mul_temp;  // sfix59_En52
  wire signed [57:0] mult_2_cast_1;  // sfix58_En52
  wire signed [32:0] mult_2_out1;  // sfix33_En27


  assign mult_2_cast = {1'b0, sq_fxd};
  assign mult_2_mul_temp = mult_2_cast * c;
  assign mult_2_cast_1 = mult_2_mul_temp[57:0];
  assign mult_2_out1 = mult_2_cast_1[57:25];



  assign t2_fxd = mult_2_out1;

endmodule  // mult_2

