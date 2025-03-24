//------------------------------------------------------------------------
//  FILENAME:  quadra.vh
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Header file for parameters.
//------------------------------------------------------------------------

`ifndef QUADRA_VH
`define QUADRA_VH

typedef logic ck_t; // clock
typedef logic rs_t; // reset
typedef logic dv_t; // data valid

// --------------------------------------------------------------------------------
// I/O precision
// --------------------------------------------------------------------------------

// x in [0,2) -> u1.23
localparam int  X_I =  1;          //         =  1
localparam int  X_F = 23;          //         = 23
localparam int  X_W = X_I + X_F;   //  1 + 23 = 24 (u1.23)

typedef logic [X_W-1:0] x_t;

// y [-2,2) -> s2.23
localparam int  Y_I =  2;          //         =  2
localparam int  Y_F = 23;          //         = 23
localparam int  Y_W = Y_I + Y_F;   //  2 + 23 = 25 (s2.23)

typedef logic signed [Y_W-1:0] y_t;

// --------------------------------------------------------------------------------
// Internal precision:
// --------------------------------------------------------------------------------

// x1: x[23:17] -> u1.6
localparam int X1_I =  1;          // integer part
localparam int X1_F =  6;          // fractional part
localparam int X1_W = X1_I + X1_F; // bit width

typedef logic [X1_W-1:0] x1_fxd_t;

// x2: x[16:0] -> u0.17
localparam int X2_I =  0;          // integer part
localparam int X2_J = X2_I - X1_F; // (this is key for proper alignment)
localparam int X2_F =  X_W - X1_W; // fractional part
localparam int X2_W = X2_I + X2_F; // bit width

typedef logic [X2_W-1:0] x2_fxd_t;

// Coefficients:
// a:
localparam int A_I =  2;  // <optimize>
localparam int A_F = 19;  // <optimize>
localparam int A_W = A_I + A_F;

typedef logic signed [A_W-1:0] a_fxd_t;

// b:
localparam int B_I =  2;  // <optimize>
localparam int B_F = 19;  // <optimize>
localparam int B_W = B_I + B_F;

typedef logic signed [B_W-1:0] b_fxd_t;

// c:
localparam int C_I =  2;  // <optimize>
localparam int C_F = 19;  // <optimize>
localparam int C_W = C_I + C_F;

typedef logic signed [C_W-1:0] c_fxd_t;

// extra working fractional bits to be rounded off at the end
localparam int R_F = 0;

localparam int S_I = Y_I;
localparam int S_F = Y_F + R_F;  // (4 extra fractional bits to be rounded)
localparam int S_W = S_I + S_F;

typedef logic [S_W-1:0] s_fxd_t;

// Polynomial calculation:

localparam int SQ_I = X2_I + X2_I;
`ifdef FULL_PRECISION
localparam int SQ_F = X2_F + X2_F;
`else
localparam int SQ_F = 19;
`endif
localparam int SQ_W = SQ_I + SQ_F;

typedef logic [SQ_W-1:0] sq_fxd_t;

localparam int T0_I =  A_I;
`ifdef FULL_PRECISION
localparam int T0_F =  A_F;
`else
localparam int T0_F =  A_F;
`endif
localparam int T0_W = T0_I + T0_F;

typedef logic signed [T0_W-1:0] t0_fxd_t;

localparam int T1_I =  B_I + X2_I;
`ifdef FULL_PRECISION
localparam int T1_F =  B_F + X2_F;
`else
localparam int T1_F =  S_F;
`endif
localparam int T1_W = T1_I + T1_F;

typedef logic signed [T1_W-1:0] t1_fxd_t;

localparam int T2_I =  C_I + SQ_I;
`ifdef  FULL_PRECISION
localparam int T2_F =  C_F + SQ_F;
`else
localparam int T2_F =  S_F;
`endif
localparam int T2_W = T2_I + T2_F;

typedef logic signed [T2_W-1:0] t2_fxd_t;

// mult_1 internal
localparam int M1_I = X2_I + B_I + 1;
localparam int M1_F = X2_F + B_F;
localparam int M1_W = M1_I + M1_F;

typedef logic [M1_W-1:0] mult_1_internal_t;

// mult_2 internal
localparam int M2_I = SQ_I + C_I + 1;
localparam int M2_F = SQ_F + C_F;
localparam int M2_W = M2_I + M2_F;

typedef logic [M2_W-1:0] mult_2_internal_t;

// squarer internal
localparam int SQI_I = X2_I + X2_I;
localparam int SQI_F = X2_F + X2_F;
localparam int SQI_W = SQI_I + SQI_F;

typedef logic [SQI_W-1:0] sq_internal_t;

// --------------------------------------------------------------------------------
// DELAY REGISTERS
// --------------------------------------------------------------------------------
localparam int DELAY_00 = 1;
localparam int DELAY_01 = 1;
localparam int DELAY_02 = 1;
localparam int DELAY_03 = 1;
localparam int DELAY_04 = 2;
localparam int DELAY_10 = 1;
localparam int DELAY_11 = 1;
localparam int DELAY_20 = 1;

`endif
