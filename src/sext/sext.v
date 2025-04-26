// verilog_format: off
//
// SIGN EXTENSION (sext lol)
//
// Given the size in bits, extends sign bit (leading bit)
// to 16 total bits
//

module sext #(parameter N=8) (
    input [15:0] in,
    output [15:0] out
);

wire msb = in[N-1];
assign out[15:N] = msb;
assign out[N-1:0] = in;

endmodule
