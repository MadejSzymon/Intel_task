//------------------------------------------------------------------------
//  FILENAME:  mult_2.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Performs multipication Cx^2 (where inputs are C and x^2).
//------------------------------------------------------------------------
`include "quadra.vh"

module mult_2 (
  input sq_fxd_t sq_fxd,
  input c_fxd_t c,
  output t2_fxd_t t2_fxd
);

  mult_2_internal_t mult_2_internal;

  // Add extra bit to perform signed multiplication
  assign mult_2_internal = signed'({1'b0, sq_fxd}) * c;
  assign t2_fxd = mult_2_internal[M2_W-2-:T2_W];

endmodule  // mult_2
