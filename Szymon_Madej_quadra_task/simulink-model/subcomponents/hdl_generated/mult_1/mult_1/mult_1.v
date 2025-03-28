// -------------------------------------------------------------
// 
// File Name: /userworkqum/szymadej/Intel_task/simulink_test/hdl_generated/mult_1/mult_1/mult_1.v
// Created: 2025-03-21 03:03:49
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
// Module: mult_1
// Source Path: mult_1
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module mult_1
          (x2_fxd,
           b,
           t1_fxd);


  input   [23:0] x2_fxd;  // ufix24_En23
  input   signed [31:0] b;  // sfix32_En28
  output  signed [30:0] t1_fxd;  // sfix31_En27


  wire [16:0] Extract_Bits1_out1;  // ufix17_En23
  wire signed [17:0] mult_1_cast;  // sfix18_En23
  wire signed [49:0] mult_1_mul_temp;  // sfix50_En51
  wire signed [48:0] mult_1_cast_1;  // sfix49_En51
  wire signed [30:0] mult_1_out1;  // sfix31_En27


  assign Extract_Bits1_out1 = x2_fxd[16:0];



  assign mult_1_cast = {1'b0, Extract_Bits1_out1};
  assign mult_1_mul_temp = mult_1_cast * b;
  assign mult_1_cast_1 = mult_1_mul_temp[48:0];
  assign mult_1_out1 = {{6{mult_1_cast_1[48]}}, mult_1_cast_1[48:24]};



  assign t1_fxd = mult_1_out1;

endmodule  // mult_1

