//------------------------------------------------------------------------
//  FILENAME:  quadra.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Core of quadra design.
//             Quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//------------------------------------------------------------------------
`include "quadra.vh"

module quadra
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x_t  x,
    output y_t  y
);

  x1_fxd_t x1_fxd;
  x2_fxd_t x2_fxd;
  x2_fxd_t x2_fxd_del;
  a_fxd_t  a;
  b_fxd_t  b;
  c_fxd_t  c;
  a_fxd_t  a_del;
  b_fxd_t  b_del;
  c_fxd_t  c_del;
  sq_fxd_t sq_fxd;
  sq_fxd_t sq_fxd_del;
  t0_fxd_t t0_fxd_del;
  t1_fxd_t t1_fxd;
  t1_fxd_t t1_fxd_del;
  t2_fxd_t t2_fxd;
  t2_fxd_t t2_fxd_del;
  s_fxd_t s_fxd;
  s_fxd_t s_fxd_del;

  assign x1_fxd = x[X_W-1-:X1_W];
  assign x2_fxd = x[X2_W-1:0];

  lut i_lut (
    .x1_fxd(x1_fxd),
    .a(a),
    .b(b),
    .c(c)
  );

  delay_register #(
    .WIDTH(B_W),
    .DELAY(DELAY_00),
    .USE_RESET(0)
  ) i_delay_register_00 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(b),
    .y_o(b_del)
  );

  delay_register #(
    .WIDTH(C_W),
    .DELAY(DELAY_01),
    .USE_RESET(0)
  ) i_delay_register_01 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(c),
    .y_o(c_del)
  );

  delay_register #(
    .WIDTH(X2_W),
    .DELAY(DELAY_02),
    .USE_RESET(0)
  ) i_delay_register_02 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(x2_fxd),
    .y_o(x2_fxd_del)
  );

  squarer i_squarer(
    .x2_fxd(x2_fxd),
    .sq_fxd(sq_fxd)
  );

  delay_register #(
    .WIDTH(SQ_W),
    .DELAY(DELAY_03),
    .USE_RESET(0)
  ) i_delay_register_03 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(sq_fxd),
    .y_o(sq_fxd_del)
  );

  delay_register #(
    .WIDTH(A_W),
    .DELAY(DELAY_04),
    .USE_RESET(0)
  ) i_delay_register_04 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(a),
    .y_o(a_del)
  );

  always_comb begin: convert_00
    t0_fxd_del = a_del[A_W-1-:T0_W];
  end

  mult_1 i_mult_1(
    .x2_fxd(x2_fxd_del),
    .b(b_del),
    .t1_fxd(t1_fxd)
  );

  mult_2 i_mult_2(
    .sq_fxd(sq_fxd_del),
    .c(c_del),
    .t2_fxd(t2_fxd)
  );

  delay_register #(
    .WIDTH(T1_W),
    .DELAY(DELAY_10),
    .USE_RESET(0)
  ) i_delay_register_10 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(t1_fxd),
    .y_o(t1_fxd_del)
  );

  delay_register #(
    .WIDTH(T2_W),
    .DELAY(DELAY_11),
    .USE_RESET(0)
  ) i_delay_register_11 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(t2_fxd),
    .y_o(t2_fxd_del)
  );

  three_in_adder i_three_in_adder (
    .t0_fxd(t0_fxd_del),
    .t1_fxd(t1_fxd_del),
    .t2_fxd(t2_fxd_del),
    .s_fxd(s_fxd)
  );

  delay_register #(
    .WIDTH(S_W),
    .DELAY(DELAY_20),
    .USE_RESET(0)
  ) i_delay_register_20 (
    .clk(clk),
    .rst_b(rst_b),
    .x_i(s_fxd),
    .y_o(s_fxd_del)
  );

  always_comb begin: convert_01
    y = s_fxd_del[S_W-1-:Y_W];
  end

endmodule // quadra
