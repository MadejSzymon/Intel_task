//------------------------------------------------------------------------
//  FILENAME:  lut.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Wrapper for Look Up Tables with coeffcients.
//------------------------------------------------------------------------
`include "quadra.vh"

module lut (
    input  x1_fxd_t x1_fxd,
    output a_fxd_t  a,
    output b_fxd_t  b,
    output c_fxd_t  c
);
  a_lut i_a_lut (
      .x1_fxd (x1_fxd),
      .a(a)
  );

  b_lut i_b_lut (
      .x1_fxd (x1_fxd),
      .b (b)
  );

  c_lut i_c_lut (
      .x1_fxd (x1_fxd),
      .c (c)
  );

endmodule // lut
