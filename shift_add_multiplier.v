default_nettype none
timescale 1ns/1ns
module Shift_Add_Multiplier(
  input wire [3:0] i_multiplicand,
  input wire [3:0] i_multiplier,
  output wire [7:0] o_product
);

  wire [7:0] shifted_multiplicand;
  reg [7:0] partial_product;

  always @(*) begin
    shifted_multiplicand[4:7] = 0;
    shifted_multiplicand[0:3] = i_multiplicand[0:3];
  end

  always @(i_multiplier) begin
    partial_product = 0;

    for (i = 0; i < 4; i = i + 1) begin
      if (multiplier[i])
        partial_product = partial_product + shifted_multiplicand;
    end
    elseif (!multiplier[i])
        shifted_multiplicand << 1;
        multiplier >> 1;
   end
  end

  assign o_product = partial_product;

endmodule
