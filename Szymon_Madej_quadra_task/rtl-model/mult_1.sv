//------------------------------------------------------------------------
//  FILENAME:  mult_1.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Performs multipication Bx (where inputs are B and x).
//------------------------------------------------------------------------
`include "quadra.vh"

module mult_1 (
  input x2_fxd_t x2_fxd,
  input b_fxd_t b,
  output t1_fxd_t t1_fxd
);

  mult_1_internal_t mult_1_internal;

  // Add extra bit to perform signed multiplication
  assign mult_1_internal = signed'({1'b0, x2_fxd}) * b;
  // Allign: -(X_J+1) sign extension at the beginning and mult_1_internal from MSB-1
  // to T1_W+X2_J
  assign t1_fxd = {{(-X2_J+1){mult_1_internal[M1_W-2]}}, mult_1_internal[M1_W-2-:(T1_W+X2_J)]};

endmodule  // mult_1


