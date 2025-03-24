//------------------------------------------------------------------------
//  FILENAME:  delay_register.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   This module implements delay register.
//  
//  Parameters:
//            - WIDTH - bit width of signal to be delayed.
//            - DELAY - length of delay register chain (if 0 module acts
//              as a passthrough).
//            - USE_RESET - if 1 reset is connected to module.
//------------------------------------------------------------------------
`include "quadra.vh"

module delay_register #(
    parameter int WIDTH = 1,
    parameter int DELAY = 1,
    parameter bit USE_RESET = 1
) (
    input ck_t clk,
    input rs_t rst_b,
    input [WIDTH-1:0] x_i,
    output [WIDTH-1:0] y_o
);

  genvar i;

  generate
    if (DELAY == 0) begin: gen_pass
      assign y_o = x_i;
    end else begin: gen_del

      logic [WIDTH-1:0] delay_r[DELAY];

      always_ff @(posedge clk) begin : gen_first_in_delay_chain
        if (USE_RESET) begin
          if (!rst_b) delay_r[0] <= {WIDTH{1'b0}};
          else delay_r[0] <= x_i;
        end else delay_r[0] <= x_i;
      end

      for (i = 1; i < DELAY; i++) begin : gen_rest_of_delay_chain
        always_ff @(posedge clk) begin
          if (USE_RESET) begin
            if (!rst_b) delay_r[i] <= {WIDTH{1'b0}};
            else delay_r[i] <= delay_r[i-1];
          end else delay_r[i] <= delay_r[i-1];
        end
      end

      assign y_o = delay_r[DELAY-1];

    end
  endgenerate


endmodule // delay_register
