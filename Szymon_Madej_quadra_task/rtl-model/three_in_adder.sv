//------------------------------------------------------------------------
//  FILENAME:  three_in_adder.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Adds three elements of calculated polynomial.
//------------------------------------------------------------------------
`include "quadra.vh"

`timescale 1 ns / 1 ns

module three_in_adder (
  input   t0_fxd_t t0_fxd,
  input   t1_fxd_t t1_fxd,
  input   t2_fxd_t t2_fxd,
  output  s_fxd_t s_fxd
);
  
  assign s_fxd = t2_fxd + t1_fxd + (t0_fxd << 4);

endmodule
