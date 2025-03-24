//------------------------------------------------------------------------
//  FILENAME:  write_to_file_real.sv
//  DESIGNER:  Szymon Madej
//  PROJECT:   Quadratic Approximation Unit
//  DATE:      2025-03-22
//  PURPOSE:   Module that allows writing captured data to file in a form
//             of real numbers.
//  Parameters:
//            DATA_WIDTH - width of captured data.
//            FRAC_WIDTH - bit width of fraction part of captured data.
//            FILENAME - name of output file.
//------------------------------------------------------------------------
module write_to_file_real #(
    parameter DATA_WIDTH = 25,
    parameter FRAC_WIDTH = 23,
    parameter FILENAME   = "example.txt"

) (
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] input_data,
    input input_valid,
    input input_ready
);

  integer fd;
  initial fd = $fopen(FILENAME, "w");

  real input_data_i;
  assign input_data_i = input_data;

  real data_to_write;
  assign data_to_write = input_data_i / (1 << FRAC_WIDTH);

  always @(posedge clk) begin
    if (!rst && input_valid && input_ready) begin
      $fwrite(fd, "%.32f\n",
              data_to_write);  //Change format specifier for your needs
    end
  end

endmodule // write_to_file_real


/*
write_to_file_real #(
    .DATA_WIDTH(25),
    .FRAC_WIDTH(23),
    .FILENAME("example.txt")
)  write_to_file_real (
    .clk(clk),
    .rst(),
    .input_data(),
    .input_valid(),
    .input_ready()
  );
*/
