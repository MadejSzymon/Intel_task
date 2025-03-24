//------------------------------------------------------------------------
//  FILENAME:  quadra_tb.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Testbench for quadra design.
//------------------------------------------------------------------------
`timescale 1 ns / 1 ns
`include "quadra.vh"

module quadra_tb();

  ck_t clk = 1'b0;
  rs_t rst_b = 1'b0;
  x_t  x = '0;
  dv_t x_dv = 1'b0;
  y_t  y;
  dv_t y_dv;
  
  int file, status;
  real value;
  x_t data_q[$]; // Queue to store fixed-point numbers
  x_t data_in;
  
  always begin
    #10;
    clk <= !clk;
  end

  quadra_top DUT
  (
    .clk(clk),
    .rst_b(rst_b),
    .x(data_in),
    .x_dv(x_dv),
    .y(y),
    .y_dv(y_dv)
  );
  
  // Read data from file and convert
  initial begin
    file = $fopen("x_fxd.dat", "r");
    if (file == 0) begin
      $display("Error: Cannot open file!");
      $finish;
    end

    // Read and convert to U1.23 format
    while (!$feof(file)) begin
      status = $fscanf(file, "%f\n", value); // Read floating-point value
      if (status == 1) begin
        data_q.push_back(int'(value * 8388608)); // Convert to U1.23 and store
      end
    end
    $fclose(file);

    // Send values to DUT
    
    repeat(10) begin
      @(posedge clk);
    end
    rst_b = 1'b1;
    
    foreach (data_q[i]) begin
      @(posedge clk);
      x_dv = 1'b1;
      data_in = data_q[i]; // Apply data to DUT
    end
    @(posedge clk);
    x_dv = 1'b0;
    repeat(10)
      @(posedge clk);
    $finish;
  end

write_to_file_real #(
    .DATA_WIDTH(Y_W),
    .FRAC_WIDTH(Y_F),
    .FILENAME("y_rtl.dat")
)  i_write_to_file_real (
    .clk(clk),
    .rst(!rst_b),
    .input_data(y),
    .input_valid(y_dv),
    .input_ready(1'b1)
  );


endmodule // quadra_tb