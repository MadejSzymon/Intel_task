//------------------------------------------------------------------------
//  FILENAME:  quadra_top.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Top module of quadra design.
//             Implements quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//             LATENCY = 3 clock cycles
//------------------------------------------------------------------------

module quadra_top
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x_t  x,
    input  dv_t x_dv,
    output y_t  y,
    output dv_t y_dv
);
    // Pipeline data valid (3 stages):
    dv_t dv_p0, dv_p1, dv_p2;

    always_ff @(posedge clk)
    if (!rst_b) begin
        dv_p0 <= '0;
        dv_p1 <= '0;
        dv_p2 <= '0;
    end
    else begin
        dv_p0 <= x_dv;
        dv_p1 <= dv_p0;
        dv_p2 <= dv_p1;
    end

    quadra i_quadra(
      .clk(clk),
      .rst_b(rst_b),
      .x(x),
      .y(y)
    );

    // Outputs:
    always_comb y_dv = dv_p2;

endmodule // quadra_top
