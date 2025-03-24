//------------------------------------------------------------------------
//  FILENAME:  squarer.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Performs square of x2 component of input.
//------------------------------------------------------------------------
`include "quadra.vh"

module squarer (
  input x2_fxd_t x2_fxd,
  output sq_fxd_t sq_fxd
);

  sq_internal_t sq_internal;

  assign sq_internal = x2_fxd * x2_fxd;
  // Allign: -2*(X_J) zeros at the beginning and sq_internal from MSB to SQ_W+2*X2_J
  assign sq_fxd = {{(-2*X2_J){1'b0}}, sq_internal[SQI_W-1-:(SQ_W+2*X2_J)]};
  
endmodule  // squarer
